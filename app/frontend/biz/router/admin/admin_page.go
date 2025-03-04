// Code generated by hertz generator. DO NOT EDIT.

package admin

import (
	"github.com/cloudwego/hertz/pkg/app/server"
	admin "github.com/wuyuesong/douyinmall/app/frontend/biz/handler/admin"
)

/*
 This file will register all the routes of the services in the master idl.
 And it will update automatically when you use the "update" command for the idl.
 So don't modify the contents of the file, or your code will be deleted when it is updated.
*/

// Register register routes based on the IDL 'api.${HTTP Method}' annotation.
func Register(r *server.Hertz) {

	root := r.Group("/", rootMw()...)
	{
		_admin := root.Group("/admin", _adminMw()...)
		_admin.GET("/home", append(_homeMw(), admin.Home)...)
	}
}
