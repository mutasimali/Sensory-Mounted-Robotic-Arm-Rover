






////////////////////////////////////
void insert(int id,String time, float hum, float temp, float bx, float by, float smoke, float methane, float flame, float front, float back){
  id++;
  //if(db.connect())
  //{
    db.execute("INSERT INTO RECORDS (ID,TIME,HUMIDITY,TEMPERATURE,BALANCE_X,BALANCE_Y,SMOKE,METHANE,FLAME,FRONT,BACK) " +
                   "VALUES ("+id+",'"+time+"','"+hum+"%%','"+temp+"c','"+bx+"','"+by+"','"+smoke+"%%','"+methane+"%%','"+flame+"','"+front+"cm','"+back+"cm');");             
  //}
  db.close();
}

///////////////////////////////////
int q_id(){//query last id number
int id=0;
      if (db.connect())
    {db.query("SELECT * FROM RECORDS where ID = (select max(ID) from RECORDS);");
     id = db.getInt("ID");}
    return id;
}
//////////////////////////////////

void create_table(){
      if (db.connect())
    {
        db.execute( "CREATE TABLE RECORDS " +
                   "(ID INT PRIMARY KEY     NOT NULL," +
                   " TIME           TEXT    NOT NULL, " + 
                   " HUMIDITY            TEXT     NOT NULL, " + 
                   " TEMPERATURE            TEXT     NOT NULL, " + 
                   " BALANCE_X            TEXT     NOT NULL, " + 
                   " BALANCE_Y            TEXT     NOT NULL, " + 
                   " SMOKE            TEXT     NOT NULL, " + 
                   " METHANE            TEXT     NOT NULL, " + 
                   " FLAME            TEXT     NOT NULL, " + 
                   " FRONT            TEXT     NOT NULL, " + 
                   " BACK            TEXT     NOT NULL)");
    }
    println("done!");
}
////////////////////////////////////
