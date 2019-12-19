package app

import (
	"BgpWebsite/vars"
	"fmt"
	"github.com/jmoiron/sqlx"
)

func ConnectDb()*sqlx.DB{
	dbname := "movie"
	dns := fmt.Sprintf("%s:%s@tcp(%s)/%s?charset=utf8",
		vars.Dbconfig.DBUsername, vars.Dbconfig.DBPassword, vars.Dbconfig.DBHost, dbname)
	db, err := sqlx.Connect("mysql", dns)
	if err != nil {
		fmt.Println(err)
	}
	return db
}

func GetMvInfo(title string, db *sqlx.DB)([]vars.Info, error){
	infos := []vars.Info{}
	err := db.Select(&infos, "select * from mv_info where title like ?","%"+title+"%")

	return infos, err
}
