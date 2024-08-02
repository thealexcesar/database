# Relational Database

Relational databases, created by Edgar F. Codd in 1970, have become the foundation for storing and managing
information in various systems. Their success is due to the fundamental principles that ensure organization,
reliability, and efficiency in data handling. Let's explore these principles in detail:

## Relational Model:
The relational model organizes data into tables, where each table represents a specific entity
(e.g., customers, products, orders). Each table has rows and columns, also known as records and attributes,
respectively. Each attribute stores a specific type of information about the entity (name, price, date, etc.).

## Keys:
Keys are crucial elements for ensuring the integrity and organization of data.
- **Primary Key**: Each table has a primary key that uniquely identifies each record. This key consists of one or more
  attributes that, together, guarantee this uniqueness (e.g., CPF number in a customer table).
- **Foreign Key**: A foreign key in a table references the primary key of another table. This relationship creates
  a link between tables, allowing the modeling of complex relationships between entities.

## Normalization:
Normalization is a process aimed at eliminating redundancy and inconsistencies in data, dividing large tables into
smaller, more focused ones. This ensures referential integrity and facilitates the updating and querying of information.

## ACID:
The acronym ACID represents the basic principles of transactions in relational databases:
- **Atomicity**: A transaction is indivisible. Either all the operations of the transaction are successfully executed, or none are.
- **Consistency**: The transaction must bring the database from one valid state to another, according to business rules.
- **Isolation**: Transactions are executed in isolation, without interfering with each other.
- **Durability**: Once a transaction is successfully completed, its changes become permanent in the database, even in case of failures.

## Query Language:
The standard query language for relational databases is SQL (Structured Query Language). It allows users to interact with the database, performing various operations such as:
- Selecting specific data from tables;
- Inserting new records;
- Updating existing data;
- Deleting records;
- Creating, modifying, and deleting tables and relationships between them.

## Benefits of Relational Databases:
- **Organization**: Clear and intuitive structure for storing and managing data.
- **Integrity**: Mechanisms to ensure the accuracy and consistency of data.
- **Efficiency**: Support for complex queries and quick data retrieval.
- **Flexibility**: Adaptability to various types of applications and business needs.
- **Standardization**: SQL language is widely used and supported by various tools and platforms.

## Applications of Relational Databases:
They are used in a wide range of applications, from inventory and accounting management systems to e-commerce platforms and social
networks. Their versatility makes them essential for managing large volumes of data in an organized, reliable, and efficient manner.
