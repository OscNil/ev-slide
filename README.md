Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.

Script for presentation on the 28:th:
https://docs.google.com/document/d/1PXJN9Ls-39Y7N5bsSsnZoY4HSNCTVEM9_2k4vtr1s04/edit?usp=sharing

Heroku address:
https://ev-slide.herokuapp.com/

DB:

<?xml version="1.0" encoding="utf-8" ?>
<!-- SQL XML created by WWW SQL Designer, https://github.com/ondras/wwwsqldesigner/ -->
<!-- Active URL: https://kitt.lewagon.com/db/2218 -->
<sql>
<datatypes db="postgresql">
 <group label="Numeric" color="rgb(238,238,170)">
  <type label="Integer" length="0" sql="INTEGER" re="INT" quote=""/>
  <type label="Small Integer" length="0" sql="SMALLINT" quote=""/>
  <type label="Big Integer" length="0" sql="BIGINT" quote=""/>
  <type label="Decimal" length="1" sql="DECIMAL" re="numeric" quote=""/>
  <type label="Serial" length="0" sql="SERIAL" re="SERIAL4" fk="Integer" quote=""/>
  <type label="Big Serial" length="0" sql="BIGSERIAL" re="SERIAL8" fk="Big Integer" quote=""/>
  <type label="Real" length="0" sql="BIGINT" quote=""/>
  <type label="Single precision" length="0" sql="FLOAT" quote=""/>
  <type label="Double precision" length="0" sql="DOUBLE" re="DOUBLE" quote=""/>
 </group>
​
 <group label="Character" color="rgb(255,200,200)">
  <type label="Char" length="1" sql="CHAR" quote="'"/>
  <type label="Varchar" length="1" sql="VARCHAR" re="CHARACTER VARYING" quote="'"/>
  <type label="Text" length="0" sql="TEXT" quote="'"/>
  <type label="Binary" length="1" sql="BYTEA" quote="'"/>
  <type label="Boolean" length="0" sql="BOOLEAN" quote="'"/>
 </group>
​
 <group label="Date &amp; Time" color="rgb(200,255,200)">
  <type label="Date" length="0" sql="DATE" quote="'"/>
  <type label="Time" length="1" sql="TIME" quote="'"/>
  <type label="Time w/ TZ" length="0" sql="TIME WITH TIME ZONE" quote="'"/>
  <type label="Interval" length="1" sql="INTERVAL" quote="'"/>
  <type label="Timestamp" length="1" sql="TIMESTAMP" quote="'"/>
  <type label="Timestamp w/ TZ" length="0" sql="TIMESTAMP WITH TIME ZONE" quote="'"/>
  <type label="Timestamp wo/ TZ" length="0" sql="TIMESTAMP WITHOUT TIME ZONE" quote="'"/>
 </group>
​
 <group label="Miscellaneous" color="rgb(200,200,255)">
  <type label="XML" length="1" sql="XML" quote="'"/>
  <type label="Bit" length="1" sql="BIT" quote="'"/>
  <type label="Bit Varying" length="1" sql="VARBIT" re="BIT VARYING" quote="'"/>
  <type label="Inet Host Addr" length="0" sql="INET" quote="'"/>
  <type label="Inet CIDR Addr" length="0" sql="CIDR" quote="'"/>
  <type label="Geometry" length="0" sql="GEOMETRY" quote="'"/>
 </group>
</datatypes><table x="779" y="131" name="users">
<row name="id" null="1" autoincrement="1">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="email" null="1" autoincrement="0">
<datatype>VARCHAR</datatype>
<default>NULL</default></row>
<row name="password" null="1" autoincrement="0">
<datatype>VARCHAR</datatype>
<default>NULL</default></row>
<row name="car_plate" null="1" autoincrement="0">
<datatype>VARCHAR</datatype>
<default>NULL</default></row>
<row name="first_name" null="1" autoincrement="0">
<datatype>VARCHAR</datatype>
<default>NULL</default></row>
<row name="last_name" null="1" autoincrement="0">
<datatype>VARCHAR</datatype>
<default>NULL</default></row>
<row name="photo" null="1" autoincrement="0">
<datatype>VARCHAR</datatype>
<default>NULL</default></row>
<row name="points" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<key type="PRIMARY" name="">
<part>id</part>
</key>
</table>
<table x="1183" y="53" name="charging_posts">
<row name="id" null="1" autoincrement="1">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<key type="PRIMARY" name="">
<part>id</part>
</key>
</table>
<table x="1283" y="243" name="charging_sessions">
<row name="id" null="1" autoincrement="1">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="charging_post_id" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default><relation table="charging_posts" row="id" />
</row>
<row name="user_id" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default><relation table="users" row="id" />
</row>
<row name="start_time" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="end_time" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<key type="PRIMARY" name="">
<part>id</part>
</key>
</table>
<table x="1057" y="374" name="queueings">
<row name="id" null="1" autoincrement="1">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="user_id" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default><relation table="users" row="id" />
</row>
<row name="start_time" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="end_time" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="status" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<key type="PRIMARY" name="">
<part>id</part>
</key>
</table>
<table x="1368" y="448" name="violations">
<row name="id" null="1" autoincrement="1">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="status" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="charging_session_id" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default><relation table="charging_sessions" row="id" />
</row>
<key type="PRIMARY" name="">
<part>id</part>
</key>
</table>
</sql>
