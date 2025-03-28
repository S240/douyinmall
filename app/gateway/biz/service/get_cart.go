package service

import (
	"context"
	"strconv"

	"github.com/cloudwego/hertz/pkg/app"
	utils "github.com/cloudwego/hertz/pkg/common/utils"
	"github.com/cloudwego/kitex/pkg/klog"
	common "github.com/wuyuesong/douyinmall/app/gateway/hertz_gen/gateway/common"
	"github.com/wuyuesong/douyinmall/app/gateway/infra/rpc"
	frontendUtils "github.com/wuyuesong/douyinmall/app/gateway/utils"
	"github.com/wuyuesong/douyinmall/rpc_gen/kitex_gen/cart"
	"github.com/wuyuesong/douyinmall/rpc_gen/kitex_gen/product"
)

type GetCartService struct {
	RequestContext *app.RequestContext
	Context        context.Context
}

func NewGetCartService(Context context.Context, RequestContext *app.RequestContext) *GetCartService {
	return &GetCartService{RequestContext: RequestContext, Context: Context}
}

func (h *GetCartService) Run(req *common.Empty) (resp map[string]any, err error) {
	// defer func() {
	// 	hlog.CtxInfof(h.Context, "req = %+v", req)
	// 	hlog.CtxInfof(h.Context, "resp = %+v", resp)
	// }()
	// todo edit your code
	cartResp, err := rpc.CartClient.GetCart(h.Context, &cart.GetCartReq{
		UserId: uint32(frontendUtils.GetUserIdFromCtx(h.Context)),
	})
	if err != nil {
		klog.Error(err.Error())
		return nil, err
	}

	var items []map[string]string
	var total float64
	for _, item := range cartResp.Items {
		productResp, err := rpc.ProductClient.GetProduct(h.Context, &product.GetProductReq{Id: item.ProductId})
		if err != nil {
			continue
		}
		p := productResp.Product
		items = append(items, map[string]string{
			"Name":        p.Name,
			"Description": p.Description,
			"Price":       strconv.FormatFloat(float64(p.Price), 'f', 2, 64),
			"Picture":     p.Picture,
			"Qty":         strconv.Itoa(int(item.Quantity)),
		})
		total += float64(p.Price) * float64(item.Quantity)

	}
	return utils.H{
		"title": "Cart",
		"items": items,
		"total": strconv.FormatFloat(float64(total), 'f', 2, 64),
	}, nil
}
