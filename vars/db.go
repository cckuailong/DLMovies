package vars

import (
	"github.com/BurntSushi/toml"
	_ "github.com/BurntSushi/toml"
	"log"
)

type DBConfig struct{
	DBHost string
	DBUsername string
	DBPassword string
}

var Dbconfig DBConfig

func init(){
	path := "conf/db.toml"
	if _, err := toml.DecodeFile(path, &Dbconfig); err != nil {
		log.Fatal(err)
	}
}
