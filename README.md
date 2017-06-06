# SQLBuilder

Xojo classes to build a SQL statement

## The Goal

Talking to a database involves creating text-based "scripts" in SQL, and these can range from very simple to quite complex. In the latter case, the code to construct the text can get involved and require tracking of values and parameters. **SQLBuilder_MTC** seeks to alleviate some of this burden by allowing you to create smart SQL in code similar to how you might type it out in a text editor.

## Advantages

There are several advantages to this approach.

- By using this builder, you can keep your SQL close to your code rather than in, for example, a constant, and that makes it easier to debug.
- Mixing languages can be problematic in any environment. With this, you can use pure Xojo code to craft your queries, making it easier to read, debug, and maintain.
- By supplying values in the individual clauses, you can avoid tracking and matching the parameters of a prepared statement to its value.
- Where your SQL will depend on outside factors that determine whether certain clauses are included, you can use "conditional where" clauses and avoid messy `if` constructs. You also avoid parameter tracking.
- You can use the builder to closely match SQL syntax with auto-complete helping at each stage.
- You can generate prepared statement for any type of database without worrying about that database engine's parameter requirements ("$1" vs. "?", for example).
- If you choose to convert your statement to text, it will be formatted for you in an easy-to-read format.
- When supplying a nil value in a Where clause, the code will substitute "IS NULL" for "=" and "IS NOT NULL" for "<>" or "!=". Conversely, it will replace "IS" with "=" and "IS NOT" with "<>" where the given value is not nil.

## Limitations

Even though I've endeavored for maximum flexibility, there are some situations where using this module will be insufficient or unwieldy. In other words, it was not designed to meet every need, just the majority of needs.

There is only limited error checking so it you want to do something that makes no sense at all, this module won't try to stop you.

## How To Use It

Open the included project and copy the **SQLBuilder\_MTC** module into your project.

To construct SQL, you can either instantiate a new `SQLBuilder_MTC.Statement` or call `SQLBuilder_MTC.SQLSelect( "*" )`. Each function in the `SQLBuilder_MTC.Statement` will return itself so you can chain the calls together.

## Table Of Contents

- [Examples](#examples)
- [Functions](#functions)
- [A Word About Parameters](#parameters)
- [A Word About Placeholders](#placeholders)
- [Who Did This?](#whodidthis)
- [FAQ](#faq)
- [Release Notes](#releasenotes)

## Examples

### Simple

Let's take a simple SQL statement like `SELECT * FROM table WHERE i = 1`. You can use any of these to create a `RecordSet`.

```
dim sb as new SQLBuilder_MTC
dim rs as RecordSet = _
  sb.SQLSelect( "*" ) _
  .From( "table" ) _
  .Where( "i", 1 ) _
  .Prepare( db ).SQLSelect
```

```
dim rs as RecordSet = _
  SQLBuilder_MTC.SQLSelect( "" ) _
  .From( "table" ) _
  .Where( "i", 1 ) _
  .Prepare( db ).SQLSelect
```

```
dim sb as new SQLBuilder_MTC
call sb.SQLSelect( "*" ) _
  .From( "table" ) _
  .Where( "i", 1 )
dim rs as RecordSet = sb.Prepare( db ).SQLSelect
```

### Conditional Where

To get a bit trickier, suppose you have a function that lets the user search your database for a person based on some combination of first name, last name, and zip code. For the purposes of this example, we know that at least one of these is always given. To do this for PostgreSQL where parameters are given in the form "$1", your code would look something like this:

```
dim whereClause() as string
dim values() as variant

if firstName <> "" then
  values.Append firstName
  whereClause.Append "first_name = $" + str( values.Ubound + 1 )
end if

if lastName <> "" then
  values.Append lastName
  whereClause.Append "last_name = $" + str( values.Ubound + 1 )
end if

if zipCode <> "" then
  values.Append zipCode
  whereClause.Append "zip = $" + str( values.Ubound + 1 )
end if

dim sql as string = _
  "SELECT * FROM person WHERE " + _
  join( whereClause, " AND " )

dim ps as PreparedSQLStatement = db.Prepare( sql )
for i as integer = 0 to values.Ubound
  ps.Bind i, values( i )
next

dim rs as RecordSet = ps.SQLSelect
```

The same result with **SQLBuilder_MTC**:

```
dim rs as RecordSet = _
  SQLBuilder_MTC.SQLSelect( "*" ) _
  .From( "person" ) _
  .CondWhere( firstName <> "", "first_name", firstName ) _
  .CondWhere( lastName <> "", "last_name", lastName ) _
  .CondWhere( zipCode <> "", "zip", zipCode ) _
  .Prepare( db ).SQLSelect
```

### Where Clause

You can use **SQLBuilder_MTC** to construct just a Where clause, and that comes in handy when you need to enclose parts of your statement in parenthesis. For example, take the statement:

`SELECT * FROM table WHERE (i = 1 or b > 2) AND c BETWEEN 5 AND 6`

The **SQLBuilder_MTC** code:

```
dim rs as RecordSet = _
  SQLBuilder_MTC.SQLSelect( "" ) _
  .From( "table" ) _
  .Where( SQLBuilder_MTC _
  . Where( "i", 1 ) _
  . OrWhere( "b", ">", 2 ) _
  ) _
  .WhereBetween( "c", 5, 6 ) _
  .Prepare( db ).SQLSelect
```

### Joins

You can create as many Joins as you'd like:

```
dim rs as RecordSet = _
  SQLBuilder_MTC.SQLSelect( "" ) _
  .From( "table t" ) _
  .LeftJoin( "another_table a", "a.id = t.another_table_id" ) _
  .CrossJoin( "something" ) _
  .Prepare( db ).SQLSelect
```

### With

Sometimes it's handy to use a With clause.

```
dim rs as RecordSet = _
  SQLBuilder_MTC.SQLWith( "some_data", SQLBuilder_MTC _
  . SQLSelect( "id" ) _
  . From( "related_table" ) _
  . Where( "some_column", 3 ) _  
  ) _
  .SQLSelect( "" ) _
  .From( "table ") _
  .WhereInQuery( "id", SQLBuilder_MTC.SQLSelect( "" ).From( "some_data" ) ) _
  .Prepare( db ).SQLSelect
```

## Functions

### Sections

- [With](#with)
- [Select](#select)
- [From](#from)
- [Joins](#joins)
- [Where](#where)
- [Conditional Where](#conditionalwhere)
- [Group By, Having, Order By, Limit, Offset](#groupby)
- [Union, Intersect, Except](#union)
- [ToString, Prepare](#tostring)
- [SQLBuilder\_MTC](#sqlbuildermtc)


The **SQLBuilder\_MTC** module is designed to help you with SQL construction by using auto-complete to lead you through it. For example, it wouldn't make sense to follow a FROM clause with SELECT, so you will only see what's possible. The tables describes these functions in the order they might appear in your SQL statement.

_Note: Prior to Xojo 2017r1.1, auto-complete does not work across line breaks like in the examples above._

### With

| function       | parameters                                      |
|----------------|-------------------------------------------------|
| SQLWith | alias As String, subQuery As SQLBuilder_MTC.StatementInterface |

### Select

| function       | parameters                                      |
|----------------|-------------------------------------------------|
| SQLSelect | expression As String, ParamArray values() As Variant |
| SQLSelectDistinct | expression As String, ParamArray values() As Variant |

### From

| function       | parameters                                      |
|----------------|-------------------------------------------------|
| From | expression As String, ParamArray values() As Variant <br /> _or_ <br /> subQuery As SQLBuilder_MTC.StatementInterface |

### Joins

| function       | parameters                                      |
|----------------|-------------------------------------------------|
| Join <br /> LeftJoin <br /> RightJoin <br />  InnerJoin <br /> OuterJoin <br /> FullJoin | table As String, onCondition As String, ParamArray values() As Variant <br /> _or_ <br /> table As String, subQuery As SQLBuilder_MTC.StatementInterface |
| CrossJoin | table As String |
| JoinRaw | expression As String, ParamArray values() As Variant |

### Where

| function       | parameters                                      |
|----------------|-------------------------------------------------|
| Where <br /> OrWhere | expression As String, value As Variant <br /> _or_ <br /> expression As String, comparison As String, value As Variant <br /> _or_ <br /> statement As SQLBuilder\_MTC.StatementInterface |
| WhereBetween <br /> OrWhereBetween <br /> WhereNotBetween <br /> OrWhereNotBetween | expression As String, lowValue As Variant, highValue As Variant |
| WhereExists <br /> OrWhereExists <br /> WhereNotExists <br /> OrWhereNotExists | subQuery As SQLBuilder\_MTC.StatementInterface |
| WhereIn <br /> OrWhereIn <br /> WhereNotIn <br /> OrWhereNotIn | expression As String, ParamArray values() As Variant |
| WhereInQuery <br /> OrWhereInQuery <br /> WhereNotInQuery <br /> OrWhereNotInQuery | expression As String, subQuery As SQLBuilder\_MTC.StatementInterface |
| WhereNot <br /> OrWhereNot | statement As SQLBuilder_MTC.StatementInterface |
| WhereNull <br /> OrWhereNull <br /> WhereNotNull <br /> OrWhereNotNull | expression As String |
| WhereRaw <br /> OrWhereRaw | expression As String, ParamArray values() As Variant |

#### <a name="conditionalwhere"></a>Conditional Where

Each Where clause has a corresponding "conditional" where clause that will only be included if the given condition is true. To use the conditional version, prefix "Cond" to the function name and supply a boolean as the first parameter. For example:

```
.Where( "i", 3 )
.CondWhere( boolCondition, "i", 3 ) // Included only if boolCondition is true

.OrWhereIn( "a", 1, 2, 3 )
.CondOrWhereIn( boolCondition, "a", 1, 2, 3 )
```
### <a name="groupby"></a>Group By, Having, Order By, Limit, Offset

| function       | parameters                                      |
|----------------|-------------------------------------------------|
| Group By | ParamArray columns() As String |
| Having | expression As String, ParamArray values() As Variant <br /> _or_ <br /> subQuery As SQLBuilder\_MTC.StatementInterface |
| Order By | ParamArray columnIndexes() As Integer <br /> _or_ <br /> ParamArray expression() As String |
| Limit | limit As Integer |
| Offset | offset As Integer |

### <a name="union"></a>Union, Intersect, Except

You can join multiple statements together using Union, Interect, and Except.

| function       | parameters                                      |
|----------------|-------------------------------------------------|
| Union <br /> Intersect <br /> Except | nextStatement As SQLBuilder_MTC.StatementInterface, isDistinct As Boolean = True |

### <a name="tostring"></a>ToString, Prepare

Once the statement is complete, you will want to do something with it. These functions will process it for you.

| function | parameters | returns|
|----------|------------|--------|
| ToString | db As Database <br /> _or_ <br /> phType As SQLBuilder\_MTC.PHTypes = SQLBuilder\_MTC.PHTypes.QuestionMark | String |
| Prepare | db As Database | PreparedSQLStatement |

_Note: The `PHTypes` enum will let you specify a placeholder type if you don't have a database instance handy and just want to view the statement as a string._

### <a name="sqlbuildermtc"></a>SQLBuilder\_MTC

As a convenience, you can initiate most statements directly from the module so you do not have to create a separate `Statement` object. The module functions include the SQLWith, SQLSelect, Where, and Conditional Where clauses.

## <a name="parameters"></a>A Word About Parameters

In many of these function you are asked for a ParamArray of Variant values. In those cases, you can supply values individually or supply an array. **SQLBuilder_MTC** will intelligently extract the right values. For example, these will be treated the same:

```
call SQLBuilder_MTC.WhereIn( "a", 1, 2, 3 )

dim arr() as integer = array( 1, 2, 3 )
call SQLBuilder_MTC.WhereIn( "a", arr )
```

## <a name="placeholders"></a>A Word About Placeholders

When creating prepared statements, different engines have different requirements. For instance, MySQL takes its paramters as "?" while PostgreSQL requires the form "$1". To maintain compatibility across engines, **SQLBuilder_MTC** expects only "?". For example:

```
.WhereRaw( "i = ? and j between ? and ?" )
```

The placeholders will be replaced correctly when processed against a database with either `ToString` or `Prepare`.

## <a name="whodidthis"></a>Who Did This?

This project was designed and implemented by:

- Kem Tekinay (ktekinay at mactechnologies.com)

## FAQ

- No FAQ yet

## <a name="releasenotes"></a>Release Notes

**1.0.2** (____, 2017)
- During debug, sql and values are logged to System.DebugLog.
- When values are bound, doubles are converted to strings with PostgreSQL databases. (Bypasses a bug in Xojo.)

**1.0.1** (May 16, 2017)
- Empty WHERE subqueries will be skipped.

**1.0** (May 1, 2017)
- Initial release.
