package main

import (
	"BgpWebsite/app"
	"BgpWebsite/vars"
	"encoding/json"
	"fmt"
	_ "github.com/go-sql-driver/mysql"
	"github.com/kataras/iris/v12"
)

func main() {
	web := iris.New()
	web.RegisterView(iris.HTML("./views", ".html"))
	web.Get("/", func(ctx iris.Context){
		_ = ctx.View("index.html")
	})
	web.HandleDir("/static", "./static")
	web.Get("/search", func(ctx iris.Context){
		res := vars.SearchRes{
			Code: 0,
			Info: []vars.Info{},
		}
		title := ctx.URLParam("title")
		if len(title) != 0{
			var err error
			db := app.ConnectDb()
			res.Info, err = app.GetMvInfo(title, db)
			if err != nil{
				fmt.Println(err)
			}
			if len(res.Info) == 0{
				res.Code = -1
			}
			db.Close()
		}else{
			res.Code = -1
		}
		if res.Code == 0{
			f_res := []vars.FinalInfo{}
			for _,item := range(res.Info){
				var tmp_urls []map[string]interface{}
				_ = json.Unmarshal([]byte(item.Urls), &tmp_urls)
				f_info := vars.FinalInfo{
					Title: item.Title,
					Urls: tmp_urls,
					Len: len(tmp_urls)+1,
				}
				f_res = append(f_res, f_info)
			}
			ctx.ViewData("infos", f_res)
			_ = ctx.View("search.html")
		}else{
			_ = ctx.View("err.html")
		}

	})
	_ = web.Run(iris.Addr(":8080"))

}

