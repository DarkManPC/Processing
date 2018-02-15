void setup(){
  int[][] matrix1 = {{1,3,5},{2,4,6}};
  
  // |1|2|
  // |3|4|
  // |5|6|
  
  int[][] matrix2 = {{2,8},{4,10},{6,12}};
  
  // |2|4 |6 |
  // |8|10|12|
  
  int[][] matrix3 = {{1,7,13},{3,9,15},{5,11,17}};
  
  // |1 |3 |5 |
  // |7 |9 |11|
  // |13|15|17|
  
  Matrix.PrintMatrix(matrix1);
  println();
  Matrix.PrintMatrix(matrix2);
  println();
  Matrix.PrintMatrix(matrix3);
  println("matrix1 * matrix2");
  Matrix.PrintMatrix(Matrix.MultMatrix(matrix1,matrix2));
  println("matrix2 * matrix1");
  Matrix.PrintMatrix(Matrix.MultMatrix(matrix2,matrix1));
  println("matrix1 * matrix3");
  Matrix.PrintMatrix(Matrix.MultMatrix(matrix1,matrix3));
  println("matrix2 * matrix3");
  Matrix.PrintMatrix(Matrix.MultMatrix(matrix2,matrix3));
  
}

static class Matrix{

static int [][] MultMatrix(int[][] A, int [][] B){
  if(A.length != B[0].length){
    println("Multiplication impossible");
    return null;
  }
  int[][] result = new int[B.length][A[0].length];
  
  for(int j = 0; j < A[0].length; j++){
    for(int i = 0; i < B.length; i++){
      result[i][j] = 0;
      for(int k = 0; k < A.length; k++){
        result[i][j] += A[k][j]*B[i][k]; 
      }
    }
  }
  
  return result;
}

static void PrintMatrix(int[][] A){
  if(A == null){
    return;
  }
  for(int j = 0; j < A[0].length; j++){
    for(int i = 0; i < A.length; i++){
      print("|"+A[i][j]);
    }
    println("|");
  }
}

}