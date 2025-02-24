# Task. Implementing ETL with SSIS

## Source Database
**AdventureWorksDW2016**

## Task Overview
Create an SSIS solution that consists of three Master Packages:
- **Main Package**
- **Two Child Packages**

### First Child Package: Database to Database & Database to Excel
#### 1.1. DB to DB
- Use any table from the source database (e.g., `[dbo].[DimAccount]`, `[dbo].[DimCurrency]`, etc.).
- Create a destination table with the same structure, plus two additional columns:
  - **UserName**
  - **ExecutionDate** (from SSIS system variables, with matching data types)
- Modify one of the existing source columns:
  - Replace it with a concatenation of two columns with different data types (e.g., Char & Date, Char & Numeric).
- Handle NULL values:
  - Replace NULL values with `'Unknown'`, ensuring data type compatibility.
- Insert transformed data into the destination table.

#### 1.2. DB to Excel
- Use any table from the source database (e.g., `[dbo].[DimAccount]`, `[dbo].[DimCurrency]`, etc.).
- Add new columns with values from SSIS system variables:
  - **ExecutionID**
  - **ExecutionDate**
- Insert transformed data into an Excel file.

### Second Child Package: Database to Flat File & Flat File to Database
#### 2.1. DB to Flat File
- Use any table from the source database (e.g., `[dbo].[DimProduct]`, `[dbo].[DimProductSubcategory]`, etc.).
- Implement **Lookup DFT Component** to retrieve additional information (e.g., lookup `ProductSubCategory` for `Product`).
- Insert data into a **Flat File**:
  - Ensure correct file properties (delimited file, delimiter, headers included).
  - Name files dynamically, incorporating the execution date.
  - Verify file content after package execution.

#### 2.2. Flat File to DB
- Use files created in the previous step.
- Create destination tables with the same structure plus additional lookup columns:
  - **Matched Rows Table** (e.g., `[dbo].[DimProduct_Destination]`)
  - **Not Matched Rows Table** (e.g., `[dbo].[DimProduct_NotMatched]`)
- Implement parallel **Data Flow Tasks**:
  - Load data from each file.
  - Use **Derived Column Component** to perform additional calculations.
  - Apply **Conditional Split Component**:
    - Redirect specific rows based on conditions.
    - Insert redirected rows into a new Flat File.
    - Load remaining data into the appropriate database tables.

## Notes
- Ensure data integrity and correct transformations.
- Dynamically generate file names where applicable.
- Use SSIS system variables for logging and tracking execution metadata.

---
This SSIS solution facilitates data movement and transformation between various sources and destinations while ensuring data enrichment and validation.