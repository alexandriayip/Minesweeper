import de.bezier.guido.*;
//Declare and initialize NUM_ROWS and NUM_COLS = 20
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> bombs = new ArrayList <MSButton>(); //ArrayList of just the minesweeper buttons that are mined
public final static int NUM_COLS =20;
public final static int NUM_ROWS =20;

void setup ()
{
    size(400, 400);
    textAlign(CENTER,CENTER);
    
    // make the manager
    Interactive.make( this );

    
  buttons = new MSButton[NUM_ROWS][NUM_COLS];  //your code to initialize buttons goes here
    for(int i =0; i<NUM_ROWS; i++){
      for(int j =0; j<NUM_COLS; j++){
        buttons [i][j] = new MSButton(i,j);
      }
    }
    
    setBombs();
}
public void setBombs()
{
  //Go to line 25 and write the setBombs() function. It should generate a random row and column number. 
  //Use the contains() function to check to see if the button at that random row and col is already in bombs. If it isn't then add it
    //your code
    
int rows = (int)Math.random()*NUM_ROWS;
int  cols = (int)Math.random()* NUM_COLS;

    if(!bombs.contains(buttons[rows][cols])){
      bombs.add(buttons[rows][cols]);
    }
    System.out.println(rows+ "" + cols);
}

public void draw ()
{
    background( 0 );
    if(isWon())
        displayWinningMessage();
}
public boolean isWon()
{
    //your code here
    return false;
}
public void displayLosingMessage()
{
    //your code here
}
public void displayWinningMessage()
{
    //your code here
}

public class MSButton
{
    private int r, c;
    private float x,y, width, height;
    private boolean clicked, marked;
    private String label;
    
    public MSButton ( int rr, int cc )
    {
         width = 400/NUM_COLS;
         height = 400/NUM_ROWS;
        r = rr;
        c = cc; 
        x = c*width;
        y = r*height;
        label = "";
        marked = clicked = false;
        Interactive.add( this ); // register it with the manager
        
        
    }
    public boolean isMarked()
    {
        return marked;
    }
    public boolean isClicked()
    {
        return clicked;
    }
    // called by manager
    
    public void mousePressed () 
    {
        clicked = true;
        //if mouseButton is RIGHT, toggles marked to either either true or false. If marked is false set click to false
        if(mouseButton == RIGHT){
        if(marked==false){
          clicked = false;
        }
        //else if bombs contains this button display the losing message
        else if(bombs.contains(this)){
          displayLosingMessage();
        }
        //else if countBombs returns a number of neighboring mines greater than zero, set the label to that number. 
        //Note that to convert the int that countBombs() returns to a String you can add an empty string: ""+countBombs()
        else if(countBombs>0)
        clicked = true;
        //your code here
    }
    }
    public void draw () 
    {    
        if (marked)
            fill(0);
         else if( clicked && bombs.contains(this) ) 
             fill(255,0,0);
        else if(clicked)
            fill( 200 );
        else 
            fill( 100 );

        rect(x, y, width, height);
        fill(0);
        text(label,x+width/2,y+height/2);
    }
    public void setLabel(String newLabel)
    {
        label = newLabel;
    }
    public boolean isValid(int r, int c)
    {
     // public boolean isValid(int row, int col) returns true if (row,col) is a valid location on the grid and false otherwise
        if(r>0 && r<=20 && c>0 && c>=20){
          return true;
        }
        return false;
    }
    public int countBombs(int row, int col) 
    //public int countBombs(int row, int col) counts the bombs in the 8 neighbors--(remember to check to see if 
    //the neighboring button is valid before checking to see if it's a mine)
    { 
      int count =0;
      if(isValid(row,col)==true){
         if(bombs.contains(buttons[row+1][col])){
      count ++;
      }
     if(bombs.contains(buttons[row-1][col])){
      count ++;
      }
      if(bombs.contains(buttons[row][col+1])){
      count ++;
      }
      
      if(bombs.contains(buttons[row][col-1])){
      count ++;
      }
      
     if(bombs.contains(buttons[row-1][col-1])){
      count ++;
      }
      
     if(bombs.contains(buttons[row+1][col+1])){
      count ++;
      }
      
      if(bombs.contains(buttons[row-1][col+1])){
      count ++;
      }
      
      if(bombs.contains(buttons[row+1][col-1])){
      count ++;
      }
      return count;
      }
      return count;
    }
}
