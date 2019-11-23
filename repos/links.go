package repos

import (
	"BgpWebsite/models"
	"github.com/jmoiron/sqlx"
)

type LinkRepository interface {
	Select(query string) []models.Link
	SelectById(query string, id int64) models.Link
	SelectByName(query string, name string) models.Link
}

func getLinksAll(db *sqlx.DB){
	links := []Link{}
	err := db.Select(&links, `select * from links;`)

}
