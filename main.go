package main

import (
	"BgpWebsite/vars"
	"fmt"
	_ "github.com/go-sql-driver/mysql"
	"github.com/jmoiron/sqlx"
)

func main() {
	//app := iris.New()
	//app.Get("/", func(ctx iris.Context){
	//	_, _ = ctx.JSON(iris.Map{
	//		"message": "pong",
	//	})
	//})
	//_ = app.Run(iris.Addr(":8080"))
	fmt.Println(vars.Dbconfig.DBHost)
}

func deal_db(){
	dbname := "tp_bgp_data"
	dns := fmt.Sprintf("%s:%s@tcp(%s)/%s?charset=utf8",
		vars.Dbconfig.DBUsername, vars.Dbconfig.DBPassword, vars.Dbconfig.DBHost, dbname)
	db, err := sqlx.Connect("mysql", dns)
	if err != nil {
		fmt.Println(err)
	}
	defer db.Close()
}