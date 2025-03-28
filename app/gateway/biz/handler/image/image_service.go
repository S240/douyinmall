package image

import (
	"context"

	"github.com/cloudwego/hertz/pkg/app"
	"github.com/cloudwego/hertz/pkg/protocol/consts"
	"github.com/wuyuesong/douyinmall/app/gateway/biz/service"
	"github.com/wuyuesong/douyinmall/app/gateway/biz/utils"
	common "github.com/wuyuesong/douyinmall/app/gateway/hertz_gen/gateway/common"
)

// Image .
// @router /image/:image [GET]
func Image(ctx context.Context, c *app.RequestContext) {
	var err error
	var req common.Empty
	err = c.BindAndValidate(&req)
	if err != nil {
		utils.SendErrResponse(ctx, c, consts.StatusOK, err)
		return
	}

	_, err = service.NewImageService(ctx, c).Run(&req)
	if err != nil {
		utils.SendErrResponse(ctx, c, consts.StatusOK, err)
		return
	}
}
