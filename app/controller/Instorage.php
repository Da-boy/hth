<?php
namespace app\controller;
use app\service\InstorageService,
    app\model\Product,
    app\model\Order;

class Instorage extends Base
{
    protected $service;
    public function __construct(InstorageService $service)
    {
        parent::__construct();
        $this->service = $service;
    }  

    public function index()
    {
        $this->assign(['list'  =>  $this->service->page()]);
        return view();
    }

    public function create()
    {

        $this->assign([
            'product'    =>  Product::all(  [ 'status' => 0 ] ),
            'product1'    =>  Product::all(  [ 'status' => 0 ] ),
        ]);
        return view();
    }
    
    public function lotscreate()
    {
        $this->assign([
            'product'    =>  Product::all(  [ 'status' => 0 ] ),
//            'supplier'   =>  Supplier::all(  [ 'status' => 0 ] ),
        ]);
        return view();
    }

    public function show($id)
    {
        $this->assign([
            // 'product'    =>  Product::all(  [ 'status' => 0 ] ),
            // 'supplier'   =>  Supplier::all(  [ 'status' => 0 ] ),
            'info'       =>  Order::get(['id'=>$id]),
//            'info1'  => $this->service->getOrder($id),
            'list'  => $this->service->getAllList($id)
        ]);
        return view();
    }

    public function save()
    {
        return $this->service->save();
    }

    public function edit($id)
    {
        $this->assign(['info'  =>  $this->service->edit($id)]);   
        return view();
    }
    public function update(){
        return $this->service->update();
    }

    public function delete($id){
        return $this->service->delete($id);
    }
    
    public function prints($id)
    {
        $this->assign([
            'info'  =>  Order::get($id),
            'list'  => $this->service->getAllList($id)
        ]);
        return view();
    }

    public function barcode($sn){
        include ROOT_PATH.'/extend/Barcode.php';
        die( \Barcode::code39($sn) );  
    }
//    public function fromIDgetSpec($id) {
//        
//        
//    }


}
