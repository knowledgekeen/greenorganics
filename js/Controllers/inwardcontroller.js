greenorganics.controller("AddInwardController", function($scope, $http, $route){
	$(".waitspinner").hide();
	$scope.addProduct = function(){
		var prodObj={
			"prodnm":$scope.prodname
		};
		$(".waitspinner").show();
		$http({
			method: 'POST',
			url: 'php/master.php?action=insertinwardproductdetails',
			headers: {'Content-Type': 'application/x-www-form-urlencoded'},
			data:prodObj
		}).
		error(function(data, status, headers, config) {
			alert('Service Error');
		}).
		then(function(result){
			if(result.data.status==true){
				$('button').attr("disabled","disabled");
				$(".waitspinner").hide();
				$("form").append("<span class='text-success'>Product Added Successfully</span>");
				prodObj=null;
				setTimeout(function(){
					$('button').removeAttr("disabled");
					$route.reload();					
				},1500);
			}
			else{
				$(".waitspinner").hide();
				alert('Error!!! Please contact system Administrator.');
			}			
		});
	};
});

greenorganics.controller("InwardProductListController", function($scope, $http, $route){
	$scope.initfunction = function(){
		$(".loadData").show();
		$(".noData").hide();
		$(".fullData").hide();
		$http({
			method: 'POST',
			url: 'php/master.php?action=allproductdetails',
			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
		}).
		error(function(data, status, headers, config) {
			alert('Service Error');
		}).
		then(function(result){
			if(result.data.status==true){
				$scope.ProductData=result.data.Products;
				$(".loadData").hide();
				$(".noData").hide();
				$(".fullData").show();				
			}
			else{
				$(".loadData").hide();
				$(".noData").show();
				$(".fullData").hide();
			}			
		});
	};
	$scope.initfunction();
	
	$scope.setProductDetails = function(prod_id, prod_name){
		$scope.prodid=prod_id;
		$scope.prodname=prod_name;
	};
	
	$scope.saveEdittedProductDetails = function(){
		var prodObj = {
			"prodid":$scope.prodid,
			"prodnm":$scope.prodname
		};
		$http({
			method: 'POST',
			url: 'php/master.php?action=saveEdittedProductDetails',
			headers: {'Content-Type': 'application/x-www-form-urlencoded'},
			data:prodObj
		}).
		error(function(data, status, headers, config) {
			alert('Service Error');
		}).
		then(function(result){
			if(result.data.status==true){
				$('.modal-body').append("<span class='text-success'><strong>Product Updated Successfully.</strong></span>");
				setTimeout(function(){
					$('.modal-body span').remove();
					$route.reload();
				},2500);
			}
			else{
				$('.modal-body').append("<span class='text-danger'><strong>Error!!! Please contact system Administrator.</strong></span>");
				setTimeout(function(){
					$('.modal-body span').remove();
				},2500);
			}			
		});
	};
	
	$scope.deleteproduct = function(){
		var prodObj = {
			"prodid":$scope.prodid
		};
		$http({
			method: 'POST',
			url: 'php/master.php?action=deleteproduct',
			headers: {'Content-Type': 'application/x-www-form-urlencoded'},
			data:prodObj
		}).
		error(function(data, status, headers, config) {
			alert('Service Error');
		}).
		then(function(result){
			if(result.data.status==true){
				$('.modal-footer').append("<br/><span class='text-success'><strong>Product Deleted Successfully.</strong></span>");
				setTimeout(function(){
					$('.modal-footer span').remove();
					$('.modal').modal('hide');
					$route.reload();
				},1500);
			}
			else{
				$('.modal-footer').append("<br/><span class='text-danger'><strong>Error!!! Please contact system Administrator.</strong></span>");
				setTimeout(function(){
					$('.modal-footer span').remove();
					$('.modal').modal('hide');
				},3500);
			}
		});
	};
	
	$scope.reload = function(){
		$route.reload();
	};
});


greenorganics.controller("PurchaseProductController", function($scope, $http, $route, $location){
	if(localStorage.inwardPayment){
		$location.path('/inwardPayment');
	}
	$scope.lorryfrieghtcheck=false;
	$(".loadSpinner").hide();
	$scope.lorryfreight=0;
	$scope.purchaseData = new Array();
	$scope.searchLorryNumber = function(){
		$('.fullData').hide();
		$('.noData').hide();
		$('.loadData').show();
		$http({
			method: 'POST',
			url: 'php/master.php?action=AllLorries',
			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
		}).
		error(function(data, status, headers, config) {
			alert('Service Error');
		}).
		then(function(result){
			if(result.data.status==true){
				$('.fullData').show();
				$('.noData').hide();
				$('.loadData').hide();
				$scope.lorryData=result.data.lorries;
			}
			else{
				$('.fullData').hide();
				$('.noData').show();
				$('.loadData').hide();
			}
		});
	};
	
	$scope.searchSupplier = function(){
		$('.fullData').hide();
		$('.noData').hide();
		$('.loadData').show();
		$http({
			method: 'POST',
			url: 'php/master.php?action=AllSuppliersNonBags',
			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
		}).
		error(function(data, status, headers, config) {
			alert('Service Error');
		}).
		then(function(result){
			if(result.data.status==true){
				$('.fullData').show();
				$('.noData').hide();
				$('.loadData').hide();
				$scope.supplierData=result.data.Suppliers;
			}
			else{
				$('.fullData').hide();
				$('.noData').show();
				$('.loadData').hide();
			}
		});
	};
	
	$scope.selectLorry = function(lorry_id, lorry_no){
		$scope.lorryid=lorry_id;
		$scope.lorrynumber=lorry_no;
		$('#lorrydetails').modal('hide');
	};
	
	$scope.setSupplier = function(supplier_id, supplier_nm,prod_id, prod_name){
		$scope.supplierid=supplier_id;
		$scope.suppliernm=supplier_nm;
		$scope.prodid=prod_id;
		$scope.prodnm=prod_name;
		$('#supplierdetails').modal('hide');
	};
	
	$scope.changeFinalAmt = function () {
		$scope.finalAmt=parseFloat($scope.rate) * parseFloat($scope.weight) + parseFloat($scope.lorryfreight);
	};	
		
	$scope.resetPurchaseForm = function(){
		$("#purchaseDt").val('');
		$scope.lorryid='';
		$scope.lorrynumber='';
		$scope.supplierid='';
		$scope.suppliernm='';
		$scope.prodid='';
		$scope.prodnm='';
		$scope.billno='';
		$scope.weight='';
		$scope.rate='';
		$scope.lorryfreight=0;
		$scope.finalAmt='';
	};
	
	$scope.reload = function(){
		$route.reload();
	};
	
	$scope.addtodb = function(){
		if($("#purchaseDt").val()=='' || $("#billDt").val()=='' || $scope.lorrynumber==undefined || $scope.suppliernm==undefined || $scope.billno==undefined || $scope.weight==undefined || $scope.rate==undefined || $scope.lorryfreight==undefined || $scope.finalAmt==undefined){
			alert('All field are compulsary.');
			throw 'All field are compulsary.';
		}
		
		var dt=new Date();
		var day=dt.setDate(parseInt($("#purchaseDt").val().split('/')[0]));
		var mnt=dt.setMonth(parseInt($("#purchaseDt").val().split('/')[1])-1);
		var Yr=dt.setYear(parseInt($("#purchaseDt").val().split('/')[2]));
		
		var billdt=new Date();
		var day=billdt.setDate(parseInt($("#billDt").val().split('/')[0]));
		var mnt=billdt.setMonth(parseInt($("#billDt").val().split('/')[1])-1);
		var Yr=billdt.setYear(parseInt($("#billDt").val().split('/')[2]));
		$(".loadSpinner").show();
		$scope.purchaseData = {
			"purchaseTm":dt.getTime(),
			"purchaseMnt":(parseInt($("#purchaseDt").val().split('/')[1])-1),
			"purchaseYr":(parseInt($("#purchaseDt").val().split('/')[2])),
			"purchaseDt":$("#purchaseDt").val(),
			"lorryid":$scope.lorryid,
			"lorryno":$scope.lorrynumber,
			"supplierid":$scope.supplierid,
			"supplier_nm":$scope.suppliernm,
			"weight":parseFloat($scope.weight),
			"billno":$scope.billno,
			"billdt":billdt.getTime(),
			"productid":$scope.prodid,
			"product":$scope.prodnm,
			"rate":$scope.rate,
			"lorryfreight":$scope.lorryfreight,
			"finalAmt":$scope.finalAmt
		};
		$http({
			method: 'POST',
			url: 'php/master.php?action=AddPurchaseDetailsToDB',
			headers: {'Content-Type': 'application/x-www-form-urlencoded'},
			data: $scope.purchaseData
		}).
		error(function(data, status, headers, config) {
			alert('Service Error');
		}).
		then(function(result){
			if(result.data.status==true){
				$(".loadSpinner").hide();
				$scope.purchaseData.purchaseId = result.data.purchaseId;
				localStorage.inwardPayment=JSON.stringify($scope.purchaseData);				
				$location.path('/inwardPayment');
			}
			else{
				$(".loadSpinner").hide();
				$(".messageDisp").append('<strong class="text-danger">Error!!! Please contact system administrator.<br/><br/></strong>');				
				setTimeout(function(){
					$(".messageDisp strong").remove();
				},3000);
			}
		});
	};
});

greenorganics.controller("PurchaseBagsListController", function($scope, $http, $route, $location){
	if(localStorage.inwardPayBags){
		$location.path('/inwardPaymentBags');
	}
	$scope.discount=0;	
	$(".loadSpinner").hide();	
	$scope.searchLorryNumber = function(){
		$('.fullData').hide();
		$('.noData').hide();
		$('.loadData').show();
		$http({
			method: 'POST',
			url: 'php/master.php?action=AllLorries',
			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
		}).
		error(function(data, status, headers, config) {
			alert('Service Error');
		}).
		then(function(result){
			if(result.data.status==true){
				$('.fullData').show();
				$('.noData').hide();
				$('.loadData').hide();
				$scope.lorryData=result.data.lorries;
			}
			else{
				$('.fullData').hide();
				$('.noData').show();
				$('.loadData').hide();
			}
		});
	};
	
	$scope.searchSupplier = function(){
		$('.fullData').hide();
		$('.noData').hide();
		$('.loadData').show();
		$http({
			method: 'POST',
			url: 'php/master.php?action=AllSuppliersOnlyBags',
			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
		}).
		error(function(data, status, headers, config) {
			alert('Service Error');
		}).
		then(function(result){
			if(result.data.status==true){
				$('.fullData').show();
				$('.noData').hide();
				$('.loadData').hide();
				$scope.supplierData=result.data.Suppliers;
			}
			else{
				$('.fullData').hide();
				$('.noData').show();
				$('.loadData').hide();
			}
		});
	};
	
	$scope.selectLorry = function(lorry_id, lorry_no){
		$scope.lorryid=lorry_id;
		$scope.lorrynumber=lorry_no;
		$('#lorrydetails').modal('hide');
	};
	
	$scope.setSupplier = function(supplier_id, supplier_nm,prod_id, prod_name){
		$scope.supplierid=supplier_id;
		$scope.suppliernm=supplier_nm;
		$scope.prodid=prod_id;
		$scope.prodnm=prod_name;
		$('#supplierdetails').modal('hide');
	};
	
	$scope.$watch('billamt-discount', function() {
		$scope.netamt = parseFloat($scope.billamt) - parseFloat($scope.discount);		
	});
	
	$scope.reload = function(){
		$route.reload();
	};
	
	$scope.addtodb = function(){
		if($("#purchaseDt").val()=='' || $scope.lorrynumber==undefined || $scope.suppliernm==undefined || $scope.billno==undefined || $scope.totalbags==undefined || $scope.billamt==undefined || $scope.discount==undefined || $scope.netamt==undefined ){
			alert('All field are compulsary.');
			throw 'All field are compulsary.';
		}
		$(".loadSpinner").show();
		
		var dt=new Date();
		var day=dt.setDate(parseInt($("#purchaseDt").val().split('/')[0]));
		var mnt=dt.setMonth(parseInt($("#purchaseDt").val().split('/')[1])-1);
		var Yr=dt.setYear(parseInt($("#purchaseDt").val().split('/')[2]));
		
		$scope.purchaseData = {
			"purchaseTm":dt.getTime(),
			"purchaseMnt":(parseInt($("#purchaseDt").val().split('/')[1])-1),
			"purchaseYr":(parseInt($("#purchaseDt").val().split('/')[2])),
			"purchaseDt":$("#purchaseDt").val(),
			"lorryid":$scope.lorryid,
			"lorryno":$scope.lorrynumber,
			"supplierid":$scope.supplierid,
			"supplier_nm":$scope.suppliernm,			
			"billno":$scope.billno,
			"billamt":$scope.billamt,
			"discount":$scope.discount,
			"netamt":$scope.netamt,
			"productid":$scope.prodid,
			"product":$scope.prodnm,			
			"totalbags":$scope.totalbags
		};
		
		$http({
			method: 'POST',
			url: 'php/master.php?action=AddPurchaseBagsToDB',
			headers: {'Content-Type': 'application/x-www-form-urlencoded'},
			data: $scope.purchaseData
		}).
		error(function(data, status, headers, config) {
			alert('Service Error');
		}).
		then(function(result){
			if(result.data.status==true){
				$(".loadSpinner").hide();
				$(".messageDisp").append('<strong class="text-success">Inward Purchase Confirmed to Data Base.<br/><br/></strong>');
				setTimeout(function(){
					$(".messageDisp strong").remove();
					//$route.reload();
					localStorage.inwardPayBags=JSON.stringify($scope.purchaseData);
					$scope.purchaseData.length=0;
					$location.path('inwardPaymentBags');
				},2000);
			}
			else{
				$(".loadSpinner").hide();
				$(".messageDisp").append('<strong class="text-danger">Error!!! Please contact system administrator.<br/><br/></strong>');				
				setTimeout(function(){
					$(".messageDisp strong").remove();
				},3000);
			}
		});
	};
});

greenorganics.controller("AddSupplierController", function($scope, $http, $route){
	$scope.prod=true;
	$scope.fillproducts = function(){
		$http({
			method: 'POST',
			url: 'php/master.php?action=allproductdetails',
			headers: {'Content-Type': 'application/x-www-form-urlencoded'},
			data: $scope.purchaseData
		}).
		error(function(data, status, headers, config) {
			alert('Service Error');
		}).
		then(function(result){
			if(result.data.status==true){
				$scope.prod=false;
				$(".loadSpinner").hide();
				$scope.productData=result.data.Products;
			}
			else{
				$(".loadSpinner").hide();
				alert('Please add a product first !!!');
			}
		});	
	};
	$scope.fillproducts();
	
	$scope.addtodb = function(){
		if($scope.suppliernm==undefined || $scope.suppliercontact==undefined || $scope.address==undefined || $scope.suppliercity==undefined || $scope.contactperson==undefined || $scope.selprod==undefined || $scope.vatno==undefined){
			alert('All field are compulsary.');
			throw "Fields Empty";
		}
		var tmpSupplier = {
			"suppliernm": $scope.suppliernm,
			"suppliercontact": $scope.suppliercontact,
			"address": $scope.address,
			"suppliercity": $scope.suppliercity,
			"contactperson": $scope.contactperson,
			"prodid": $scope.selprod,
			"vatno": $scope.vatno
		};
		$(".loadSpinner").show();
		$http({
			method: 'POST',
			url: 'php/master.php?action=AddSupplierToDB',
			headers: {'Content-Type': 'application/x-www-form-urlencoded'},
			data: tmpSupplier
		}).
		error(function(data, status, headers, config) {
			alert('Service Error');
		}).
		then(function(result){
			if(result.data.status==true){
				$scope.prod=true;
				$(".messageDisp").append('<strong class="text-success">Supplier Added Successfully.<br/><br/></strong>');
				tmpSupplier=null;
				setTimeout(function(){
					$(".loadSpinner").hide();
					$(".messageDisp strong").remove();
					$route.reload();
				},2000);
			}
			else{
				$(".loadSpinner").hide();
				$(".messageDisp").append('<strong class="text-danger">Error!!! Please contact system administrator.<br/><br/></strong>');
				setTimeout(function(){
					$(".messageDisp strong").remove();
				},3000);
			}
		});	
	};
});

greenorganics.controller("SupplierListController", function($scope, $http, $route){
	$scope.loadSuppliers = function(){
		$('.fullData').hide();
		$('.noData').hide();
		$('.loadData').show();
		$http({
			method: 'POST',
			url: 'php/master.php?action=AllSuppliers',
			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
		}).
		error(function(data, status, headers, config) {
			alert('Service Error');
		}).
		then(function(result){
			if(result.data.status==true){
				$('.fullData').show();
				$('.noData').hide();
				$('.loadData').hide();
				$scope.supplierData=result.data.Suppliers;
			}
			else{
				$('.fullData').hide();
				$('.noData').show();
				$('.loadData').hide();
			}
		});
	};
	$scope.loadSuppliers();
	
	$scope.setEditSupplierDetails = function(suppid, suppnm){
		$scope.suppid=suppid;
		$scope.suppnm=suppnm;
		$scope.fetchSpecificSupplierDetails();
	};
	
	$scope.setDeleteSupplierDetails = function(suppid, suppnm){
		$scope.suppid=suppid;
		$scope.suppnm=suppnm;		
	};
	
	$scope.saveEdittedSupplierDetails = function(){
		if($scope.suppliernm==undefined || $scope.suppliercontact==undefined || $scope.address==undefined || $scope.suppliercity==undefined || $scope.contactperson==undefined || $scope.vatno==undefined){
			alert('All field are compulsary.');
			throw "Fields Empty";
		}
		var tmpSupplier = {
			"suppid": $scope.suppid,
			"suppliernm": $scope.suppliernm,
			"suppliercontact": $scope.suppliercontact,
			"address": $scope.address,
			"suppliercity": $scope.suppliercity,
			"contactperson": $scope.contactperson,
			"vatno": $scope.vatno
		};
		$(".loadSpinner").show();
		$http({
			method: 'POST',
			url: 'php/master.php?action=updtSupplierDetails',
			headers: {'Content-Type': 'application/x-www-form-urlencoded'},
			data: tmpSupplier
		}).
		error(function(data, status, headers, config) {
			alert('Service Error');
		}).
		then(function(result){
			if(result.data.status==true){
				$scope.prod=true;
				$(".messageDisp").append('<strong class="text-success">Supplier Added Successfully.<br/><br/></strong>');
				tmpSupplier=null;
				setTimeout(function(){
					$(".loadSpinner").hide();
					$(".messageDisp strong").remove();
					$route.reload();
				},2000);
			}
			else{
				$(".loadSpinner").hide();
				$(".messageDisp").append('<strong class="text-danger">Error!!! Please contact system administrator.<br/><br/></strong>');
				setTimeout(function(){
					$(".messageDisp strong").remove();
				},3000);
			}
		});
	};
	
	$scope.fetchSpecificSupplierDetails = function(){
		$scope.prod=true;
		$http({
		method: 'POST',
		url: 'php/master.php?action=fetchSpecificSupplierDetails',
		headers: {'Content-Type': 'application/x-www-form-urlencoded'},
		data:$scope.suppid
		}).
		error(function(data, status, headers, config) {
			alert('Service Error');
		}).
		then(function(result){
				if(result.data.status==true){
					$scope.prod=false;
					$scope.suppliernm=result.data.Suppliers.supplier_nm;
					$scope.suppliercontact=result.data.Suppliers.supplier_contact
					$scope.address=result.data.Suppliers.supplier_address
					$scope.suppliercity=result.data.Suppliers.supplier_city
					$scope.contactperson=result.data.Suppliers.supplier_contact_person
					$scope.vatno=result.data.Suppliers.supplier_vatno
				}
				else{
					alert('Error!!! Please contact system administrator.');
				}
		});
	};
	
	$scope.deactivatesupplier = function(){
		$http({
		method: 'POST',
		url: 'php/master.php?action=deactivatesupplier',
		headers: {'Content-Type': 'application/x-www-form-urlencoded'},
		data:$scope.suppid
		}).
		error(function(data, status, headers, config) {
			alert('Service Error');
		}).
		then(function(result){
			if(result.data.status==true){
				$(".modal-footer").prepend('<strong class="text-success">Supplier Deactivated Successfully</strong>');
				setTimeout(function(){
					$(".modal-footer strong").remove();
					$route.reload();
				},2000);
			}
			else{
				alert('Error!!! Please contact system administrator.');
			}
		});
	};	
	
	$scope.reload = function(){
		$route.reload();
	};
});

greenorganics.controller("DeactiveSupplierListController", function($scope, $http, $route){
	$scope.loadSuppliers = function(){
		$('.fullData').hide();
		$('.noData').hide();
		$('.loadData').show();
		$http({
			method: 'POST',
			url: 'php/master.php?action=AllDeactiveSuppliers',
			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
		}).
		error(function(data, status, headers, config) {
			alert('Service Error');
		}).
		then(function(result){
			if(result.data.status==true){
				$('.fullData').show();
				$('.noData').hide();
				$('.loadData').hide();
				$scope.supplierData=result.data.Suppliers;
			}
			else{
				$('.fullData').hide();
				$('.noData').show();
				$('.loadData').hide();
			}
		});
	};
	$scope.loadSuppliers();
	
	$scope.activatesuppliers = function(suppid){		
		$http({
			method: 'POST',
			url: 'php/master.php?action=activatesuppliers',
			headers: {'Content-Type': 'application/x-www-form-urlencoded'},
			data:suppid
		}).
		error(function(data, status, headers, config) {
			alert('Service Error');
		}).
		then(function(result){
			if(result.data.status==true){
				$('.displayMsg').append('<strong class="text-success">Supplier Activated Successfully</strong>');
				setTimeout(function(){
					$route.reload();
				},1500);
			}
			else{
				
			}
		});
	};
	
	$scope.reload = function(){
		$route.reload();
	};
});

greenorganics.controller("PurchasePaymentController", function($scope, $http, $route, $location){
	if(!localStorage.inwardPayment){
		$location.path('/purchase_inward_product');
	}
	$scope.inwardPayment=JSON.parse(localStorage.inwardPayment);
	console.log($scope.inwardPayment);
	$('.loadSpinner').hide();
	$scope.payAmt='';
	$scope.$watch('payAmt', function() {
		if(parseInt($scope.payAmt)<=parseInt($scope.inwardPayment.finalAmt)){
			$scope.remPay=parseInt($scope.inwardPayment.finalAmt)-parseInt($scope.payAmt);
		}
		else{
			$scope.remPay=0;
		}
	});
	
	$scope.makePayment = function(){
		if($scope.payAmt==undefined || $scope.particulars==undefined || $scope.payAmt=="" || $scope.particulars==""){
			alert('Fields cannot be Empty');
			throw 'Please check Amount';
		}
		
		if(parseFloat($scope.payAmt)>parseFloat($scope.inwardPayment.finalAmt)){
			alert('Payment amount is more than Final amount');
			$scope.payAmt=0;
			throw 'Please check Amount';
		}
		
		if($scope.payAmt==0){
			$scope.inwardPayment.payFlag=true;
		}
		else{
			$scope.inwardPayment.payFlag=false;
		}
		
		$scope.inwardPayment.payAmount=$scope.payAmt;
		$scope.inwardPayment.pendingPayment=$scope.remPay;
		$scope.inwardPayment.payParticulars=$scope.particulars;
		
		console.log($scope.inwardPayment);
		$http({
			method: 'POST',
			url: 'php/master.php?action=makeInwardPayment',
			headers: {'Content-Type': 'application/x-www-form-urlencoded'},
			data:$scope.inwardPayment
		}).
		error(function(data, status, headers, config) {
			alert('Service Error');
		}).
		then(function(result){
			if(result.data.status==true){
				localStorage.removeItem('inwardPayment');
				$location.path('/purchase_inward_product');
			}
			else{
				alert('Service Error, Please contact your Administrator.');
				throw 'fail';
			}
		});
	};
});

greenorganics.controller("PurchaseBagsPaymentController", function($scope, $http, $route, $location){
	if(!localStorage.inwardPayBags){
		$location.path('/purchase_inward_bags');
	}
	$scope.inwardPayBags=JSON.parse(localStorage.inwardPayBags);
	console.log($scope.inwardPayBags);
	$('.loadSpinner').hide();
	$scope.payAmt='';
	$scope.$watch('payAmt', function() {
		if(parseInt($scope.payAmt)<=parseInt($scope.inwardPayBags.netamt)){
			$scope.remPay=parseInt($scope.inwardPayBags.netamt)-parseInt($scope.payAmt);
		}
		else{
			$scope.remPay=0;
		}
	});
	
	$scope.makePayment = function(){
		if($scope.payAmt==undefined || $scope.particulars==undefined || $scope.payAmt=="" || $scope.particulars==""){
			alert('Fields cannot be Empty');
			throw 'Please check Amount';
		}
		
		if(parseFloat($scope.payAmt)>parseFloat($scope.inwardPayBags.netamt)){
			alert('Payment amount is more than Final amount');
			$scope.payAmt=0;
			throw 'Please check Amount';
		}
		
		if($scope.payAmt==0){
			$scope.inwardPayBags.payFlag=true;
		}
		else{
			$scope.inwardPayBags.payFlag=false;
		}
		
		$scope.inwardPayBags.payAmount=$scope.payAmt;
		$scope.inwardPayBags.pendingPayment=$scope.remPay;
		$scope.inwardPayBags.payParticulars=$scope.particulars;
		
		console.log($scope.inwardPayBags);
		$http({
			method: 'POST',
			url: 'php/master.php?action=makeinwardPayBags',
			headers: {'Content-Type': 'application/x-www-form-urlencoded'},
			data:$scope.inwardPayBags
		}).
		error(function(data, status, headers, config) {
			alert('Service Error');
		}).
		then(function(result){
			if(result.data.status==true){
				localStorage.removeItem('inwardPayBags');
				$location.path('/purchase_inward_bags');
			}
			else{
				alert('Service Error, Please contact your Administrator.');
				throw 'fail';
			}
		});
	};
});