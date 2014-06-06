/*
  Table.pde
  Taken from the book 'Data Visualization' by Ben Fry.
*/

class Table {
  int rowCount;
  public String[][] data;
  
  
  Table(String filename) {
    String[] rows = loadStrings(filename);
    data = new String[rows.length][];
    
    for (int i = 0; i < rows.length; i++) {
      if (trim(rows[i]).length() == 0) {
        continue; // skip empty rows
      }
      if (rows[i].startsWith("#")) {
        continue;  // skip comment lines
      }
      
      // split the row on the commas
      String[] pieces = split(rows[i], ',');

      // copy to the table array
      data[rowCount] = pieces;
      rowCount++;
    }
    // resize the 'data' array as necessary
    data = (String[][]) subset(data, 0, rowCount);
  }
  
  
  int getRowCount() {
    return rowCount;
  }
  
  
  // find a row by its name, returns -1 if no row found
  int getRowIndex(String name) {
    for (int i = 0; i < rowCount; i++) {
      if (data[i][0].equals(name)) {
        return i;
      }
    }
    println("No row named '" + name + "' was found");
    return -1;
  }
  
  
  String getRowName(int row) {
    return getString(row, 0);
  }


  String getString(int rowIndex, int column) {
    return data[rowIndex][column];
  }

  
  String getString(String rowName, int column) {
    return getString(getRowIndex(rowName), column);
  }

  
  int getInt(String rowName, int column) {
    return parseInt(getString(rowName, column));
  }

  
  int getInt(int rowIndex, int column) {
    return parseInt(getString(rowIndex, column));
  }

  
  float getFloat(String rowName, int column) {
    return parseFloat(getString(rowName, column));
  }

  
  float getFloat(int rowIndex, int column) {
    return parseFloat(getString(rowIndex, column));
  }  

  float getColumnMin(int column) {
    float minimum = MAX_FLOAT;
    float value;
    for (int i = 1; i < rowCount; ++i) {
      value = getFloat(i,column);
      minimum = min(value, minimum);
    }

    return minimum;
  }
  
  float getColumnMax(int column) {
    float maximum = MIN_FLOAT;
    float value;
    for (int i = 1; i < rowCount; ++i) {
      value = getFloat(i,column);
      maximum = max(value, maximum);
    }

    return maximum;
  }
}