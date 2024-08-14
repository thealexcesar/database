# Module 05 – Relational Database

Welcome to the Relational Database module! This folder contains all the materials, examples, and exercises related to
relational databases, primarily focused on PostgreSQL, with some introductory content on MongoDB as well.

## Content Overview

### <a href="https://github.com/thealexcesar/T-Academy/tree/main/database/SQL">SQL Database</a>

- **What is a Database**
  - **Concept**: A structured collection of data stored and accessed electronically. Databases are managed by Database Management Systems (DBMS).

- **Categories of Databases**
  - **Relational Databases**: Data is stored in tables with rows and columns. Examples include MySQL, PostgreSQL.
  - **NoSQL Databases**: Designed for large-scale data storage and retrieval. Examples include MongoDB, Cassandra.
  - **Object-Oriented Databases**: Data is stored in objects, similar to object-oriented programming. Examples include db4o, ObjectDB.
  - **Hierarchical Databases**: Data is organized in a tree-like structure. Examples include IBM Information Management System (IMS).
  - **Network Databases**: Data is represented in a graph structure with nodes and relationships. Examples include Integrated Data Store (IDS).

- **DBMS Concepts**
  - **Definition**: Software that facilitates the creation, manipulation, and administration of databases, handling data storage, retrieval, and updating.
  - **Examples**: MySQL, Oracle, Microsoft SQL Server.

- **Database Modeling**
  - **Concept**: The process of designing the structure of a database, including defining tables, relationships, and constraints.
  - **Tools**: Entity-Relationship Diagrams (ERDs), UML Class Diagrams.

- **DDL Commands**
  - **Definition**: Data Definition Language commands used to define and modify the structure of database objects.
  - **Examples**:
    - `CREATE TABLE`: Defines a new table.
    - `ALTER TABLE`: Modifies an existing table.
    - `DROP TABLE`: Deletes a table.

- **Indexes**
  - **Concept**: Database objects that improve the speed of data retrieval operations on a table.
  - **Types**: B-Tree, Hash, Bitmap.

- **Constraints**
  - **Concept**: Rules applied to columns or tables to enforce data integrity.
  - **Examples**: `NOT NULL`, `UNIQUE`, `CHECK`.

- **Foreign Keys**
  - **Concept**: A constraint that ensures the values in a column (or a set of columns) match values in another table’s primary key.

- **DML Commands**
  - **Definition**: Data Manipulation Language commands used for managing data within tables.
  - **Examples**:
    - `INSERT INTO`: Adds new data to a table.
    - `UPDATE`: Modifies existing data.
    - `DELETE`: Removes data from a table.

- **DQL Commands**
  - **Definition**: Data Query Language commands used to retrieve data from a database.
  - **Examples**:
    - `SELECT`: Retrieves data.
    - `WHERE`: Filters results.
    - `UNION`: Combines results from multiple queries.
    - `JOIN`: Combines rows from two or more tables.
    - **Aggregation Functions**: Functions like `SUM`, `AVG`, `COUNT`.
    - `GROUP BY`: Groups results by one or more columns.
    - `ORDER BY`: Sorts results.

- **TCL Commands**
  - **Definition**: Transaction Control Language commands used to manage transactions.
  - **Examples**:
    - `COMMIT`: Saves changes made during a transaction.
    - `ROLLBACK`: Undoes changes made during a transaction.
    - `SAVEPOINT`: Sets a point in a transaction to which you can roll back.

- **Normalization and Denormalization**
  - **Normalization**: The process of organizing data to minimize redundancy and improve data integrity.
    - Forms: 1NF, 2NF, 3NF, BCNF.
  - **Denormalization**: The process of introducing redundancy to improve read performance.

- **Optimizing Queries**
  - **Concept**: Techniques used to improve the performance of SQL queries.
  - **Methods**: Indexing, query optimization, avoiding unnecessary columns and joins.

---

### <a href="https://github.com/thealexcesar/T-Academy/tree/main/database/NoSQL">NoSQL Database</a>

This section introduces NoSQL databases, focusing on MongoDB. NoSQL databases differ from relational databases in their approach to data storage and retrieval, offering more flexibility in handling unstructured and semi-structured data.

#### Key Topics Covered:
- **What is NoSQL**
  - **Concept**: NoSQL databases are designed to handle large volumes of diverse data types, offering horizontal scalability and flexibility in data modeling.

- **Types of NoSQL Databases**
  - **Document-Oriented**: Stores data in JSON-like documents. Example: MongoDB.
  - **Key-Value Stores**: Stores data as key-value pairs. Example: Redis.
  - **Column-Family Stores**: Stores data in columns rather than rows. Example: Cassandra.
  - **Graph Databases**: Focuses on the relationships between data entities. Example: Neo4j.

- **MongoDB Overview**
  - **Data Storage**: MongoDB stores data in flexible, JSON-like documents (BSON), which can vary in structure.
  - **Scalability**: Supports horizontal scaling through sharding.
  - **CRUD Operations**: Examples of Create, Read, Update, and Delete operations in MongoDB.
  - **Indexing and Aggregation**: Techniques to improve query performance and perform complex data aggregations.

- **When to Use NoSQL**
  - **Use Cases**: Applications requiring flexible schema design, high throughput, and the ability to handle large amounts of unstructured data, such as real-time analytics, IoT, and content management systems.

---

## How to Use This Module

Each topic is documented with examples and explanations that will help you understand the practical application of the concepts. You can start by reviewing the main topics and then dive into the code examples provided.

## Additional Resources

For more information on other modules in the T-Academy bootcamp, visit the [main repository](https://github.com/thealexcesar/T-Academy).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
