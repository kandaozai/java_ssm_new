;
(function($, window, document, undfined) {
	var RulerDragging = function(ele, opt) {
		this.$element = ele;
		this.defaults = {};
		this.options = $.extend({}, this.defaults, opt)
	}
	RulerDragging.prototype = {
		//初始化
		init: function(platformIndex, cycleIndex) { //第一个参数为平台索引，第二个参数为当前平台的周期索引
			var currentAmount;
			var defaultAmount = this.options[platformIndex][cycleIndex].defaultAmount;
			var minAmount = this.options[platformIndex][cycleIndex].minAmount;
			var stepAmount = this.options[platformIndex][cycleIndex].stepAmount;
			if (stepAmount == undefined) {
				stepAmount = defaultStepAmount;
			}
			if (defaultAmount > 0) {
				currentAmount = defaultAmount;
			} else {
				currentAmount = minAmount + stepAmount * 3
			}
			myAmount.eq(platformIndex).attr("value", currentAmount);
			myAmount.eq(platformIndex).val(currentAmount);
			this.setInputWidth(platformIndex);
			this.generatingRuler(platformIndex, minAmount, stepAmount, defaultAmount);
		},
		setInputWidth: function(platformIndex) { //设置“我要投资”文本框宽度
			myAmount.eq(platformIndex).width(myAmount.eq(platformIndex).val().length * 11);
		},
		//生成标尺
		generatingRuler: function(platformIndex, minAmount, stepAmount, defaultAmount) { //生成标尺
			var currentAmount;
			if (defaultAmount == undefined) {
				defaultAmount = minAmount + stepAmount * 3;
			}
			var inputAmount2 = parseInt((defaultAmount - minAmount) / stepAmount) * stepAmount + minAmount;
			currentAmount = inputAmount2 - 12 * stepAmount;
			//currentMinAmount[platformIndex] = currentAmount + stepAmount;
			for (var m = 0; m < 23; m++) {
				currentAmount = currentAmount + stepAmount;
				if (currentAmount < minAmount) {
					if (m == 11) {
						currentAmount = minAmount;
						//currentMinAmount[platformIndex] = currentAmount + stepAmount;
						scale.eq(platformIndex).append("<span>" + currentAmount + "</span>");
					} else {
						scale.eq(platformIndex).append("<span></span>");
					}
				} else {
					//currentMaxAmount[platformIndex] = currentAmount;
					scale.eq(platformIndex).append("<span>" + currentAmount + "</span>");
				}
				scale.eq(platformIndex).width(50 * (m + 1));
			}
			scale.eq(platformIndex).css("left", parseInt((inputAmount2 - defaultAmount) / (stepAmount / 10) * 5) - 450);
		},
		//改变刻度金额
		changeAmount: function(inputAmount, platformIndex, cycleIndex) {
	
			var currentAmount;
			var minAmount = this.options[platformIndex][0].minAmount;
			
			var stepAmount = this.options[platformIndex][0].stepAmount;
			if (stepAmount == undefined) {
				stepAmount = defaultStepAmount;
			}
			var inputAmount2 = parseInt((inputAmount - minAmount) / stepAmount) * stepAmount + minAmount;
			currentAmount = inputAmount2 - 12 * stepAmount;
			//currentMinAmount[platformIndex] = currentAmount + stepAmount;
			var scaleSpan = scale.eq(platformIndex).children("span");
			var scaleSpanNum = scaleSpan.lenght;
			for (var m = 0; m < 23; m++) {
				currentAmount = currentAmount + stepAmount;
				if (currentAmount < minAmount) {
					scaleSpan.eq(m).html("");
					if (m == 11) {
						currentAmount = minAmount;
						//currentMinAmount[platformIndex] = currentAmount + stepAmount;
						scaleSpan.eq(m).html(currentAmount);
					}
				} else {
					//currentMaxAmount[platformIndex] = currentAmount;
					scaleSpan.eq(m).html(currentAmount);
				}
			}
			scale.eq(platformIndex).css("left", parseInt((inputAmount2 - inputAmount) / (stepAmount / 10) * 5) - 450);
		},
		//计算收益
		calculateProfit: function(platformIndex, cycleIndex) {
			//投资周期
			var cycle = this.options[platformIndex][cycleIndex].cycle;
			//标的类型
			var type = this.options[platformIndex][cycleIndex].type;
			//原财气加息
			var annualYield = this.options[platformIndex][cycleIndex].annualYield;
			//平台年化
			var platRate = this.options[platformIndex][cycleIndex].platRate;
			//综合年化
			var unitRate = this.options[platformIndex][cycleIndex].unitRate;
			//我的投资金额
			var myInvestmentAmount = parseInt(myAmount.eq(platformIndex).attr("value"));
			
			var companyid = $(".zhidet-rebate").eq(platformIndex).attr("data");
			if (type == 1) {
				//月标
				//平台利息
				$(".interest-income").eq(platformIndex).html((myInvestmentAmount * platRate / 1200 * cycle).toFixed(2));
				//财气加息
				$(".total-income").eq(platformIndex).html((myInvestmentAmount * annualYield / 1200 * cycle).toFixed(2));
				$(".zhidet-rebate").eq(platformIndex).html((myInvestmentAmount * unitRate / 1200 * cycle).toFixed(2));
			} else {
				//财气加息
				$(".total-income").eq(platformIndex).html((myInvestmentAmount * annualYield / 36500 * cycle).toFixed(2));
				//平台利息
				$(".interest-income").eq(platformIndex).html((myInvestmentAmount * platRate / 36500 * cycle).toFixed(2));
				$(".zhidet-rebate").eq(platformIndex).html((myInvestmentAmount * unitRate / 36500 * cycle).toFixed(2));
			}
		}
	}
	$.fn.rulerDragging = function(options) {
		defaultStepAmount = 1000; //默认步长
		var platformIndex = 0; //平台
		var newAmount1 = 0;
		var newAmount2 = 0;
		var scaleX = 0;
		var copyNum = 0;
		var distance = 0;
		var surplus1 = 0;
		var surplus2 = 0;
		var flag = 0;
		var currentMousex = 0;
		var isDragging = false;
		var stopping;
		//currentMinAmount = new Array; //标尺最左侧的值
		//currentMaxAmount = new Array; //标尺最右侧的值
		var currentMinAmount = 0;
		var currentMaxAmount = 0;
		var ruler = $(".ruler");
		scale = $(".ruler .scale");
		myAmount = $(".my-investment-amount");
		var myDragging = new RulerDragging(this, options);
		var total = myDragging.$element.length;
		for (var n = 0; n < total; n++) {
			myDragging.init(n, 0);
			myDragging.calculateProfit(n, 0);
		}
		myDragging.$element.mousedown(function() {
			platformIndex = $(this).index();
		});
		myAmount.keyup(function() {
			inputAmount = 0;
	
			var minAmount = myDragging.options[platformIndex][0].minAmount;
			
			if ($(this).val() <= minAmount) {
				inputAmount = minAmount
			} 
			if (minAmount < parseInt($(this).val()) && parseInt($(this).val()) < 800000) {
				inputAmount = $(this).val();
			} 
			if($(this).val() >= 800000){
				inputAmount=800000;
				$(this).val(inputAmount);
			}
			$(this).attr("value", inputAmount);
			myDragging.setInputWidth(platformIndex);
			myDragging.changeAmount(inputAmount, platformIndex, platformIndex);
			myDragging.calculateProfit(platformIndex, 0);
		});
		myAmount.blur(function() {
			$(this).val(inputAmount);
			myDragging.setInputWidth(platformIndex);
		})
		ruler.on({
			mousedown: function(event) {
				flag = 0;
				platformIndex = $(this).parent("div").parent(".novice_list div.clear-fix").index();
				isDragging = true;
				stopping = false;
				currentMousex = event.pageX;
				scaleX = scale.eq(platformIndex).position().left;
				currentAmount = parseInt(myAmount.eq(platformIndex).attr("value"));
				minAmount = myDragging.options[platformIndex][0].minAmount;
				stepAmount = myDragging.options[platformIndex][0].stepAmount;
				return false;
			},
			mousemove: function(event) {

				if (isDragging) {
					var myInvestmentAmount = myAmount.eq(platformIndex);
					var mouseX = event.pageX;
					distance = mouseX - currentMousex;
					if (parseInt(scale.eq(platformIndex).children("span").eq(22).html()) >= (800000 + stepAmount * 12) && distance < 0) {
						stopping = true;
					} else {
						stopping = false;
					}
					if (stopping == false) {
						scaleLeft = scaleX + distance;
						newAmount1 = currentAmount - distance * stepAmount / 50;
						//console.log(newAmount1);
						if (newAmount1 < minAmount) {
							myInvestmentAmount.attr("value", minAmount);
							myInvestmentAmount.val(newAmount2);
							//scale.eq(platformIndex).css("left", "-400px");
							isDragging = false;
						} else {
							//四舍五入
							newAmount2 = Math.round(newAmount1 / 100) * 100;
							//设置我要投资中的金额；
							//console.log(newAmount1);
							//console.log(newAmount2);
							myInvestmentAmount.attr("value", newAmount2);
							myInvestmentAmount.val(newAmount2);
							myDragging.setInputWidth(platformIndex);
							//移动标尺
							scale.eq(platformIndex).css("left", scaleLeft);
						}
						myDragging.calculateProfit(platformIndex, 0);
					}
				}
			},
			mouseup: function() {
				if (stopping == false) {
					isDragging = false;
					currentAmount = newAmount1;
					if (flag == 0) {
						//往左拖曳
						if (distance < 0) {
							copyNum = parseInt((Math.abs(distance) + surplus1) / 50);
							surplus1 = Math.abs(distance) + surplus1 - copyNum * 50; //取整后的剩余部分；
							currentMaxAmount = parseInt(scale.eq(platformIndex).children("span").eq(22).html());
							for (var k = 0; k < copyNum; k++) {
								currentMaxAmount += stepAmount;
								scale.eq(platformIndex).append("<span>" + currentMaxAmount + "</span>");
								scale.eq(platformIndex).children("span").eq(0).remove();
								scaleLeft += 50;
								scale.eq(platformIndex).css("left", scaleLeft);

							}
						}
						//往右拖曳
						if (distance > 0) {
							copyNum = parseInt((Math.abs(distance) + surplus2) / 50);
							surplus2 = Math.abs(distance) + surplus2 - copyNum * 50; //取整后的剩余部分；
							currentMinAmount = parseInt(scale.eq(platformIndex).children("span").eq(0).html());
							for (k = 0; k < copyNum; k++) {
								currentMinAmount -= stepAmount;
								if (currentMinAmount >= minAmount) {
									scale.eq(platformIndex).prepend("<span>" + currentMinAmount + "</span>"); //增加1个span，span的个数为24
								} else {
									currentMinAmount = minAmount;
									scale.eq(platformIndex).prepend("<span></span>");
								}
								scale.eq(platformIndex).children("span").eq(23).remove(); //增加了1个span后，span的个数为24
								scaleLeft -= 50;
								scale.eq(platformIndex).css("left", scaleLeft);
							}
						}
						flag = 1;
					}
				}
			},
			mouseleave: function() {
				if (stopping == false) {
					isDragging = false;
					currentAmount = newAmount1;
					if (flag == 0) {
						//往左拖曳
						if (distance < 0) {
							copyNum = parseInt((Math.abs(distance) + surplus1) / 50);
							surplus1 = Math.abs(distance) + surplus1 - copyNum * 50; //取整后的剩余部分；
							currentMaxAmount = parseInt(scale.eq(platformIndex).children("span").eq(22).html());
							for (var k = 0; k < copyNum; k++) {
								currentMaxAmount += stepAmount;
								scale.eq(platformIndex).append("<span>" + currentMaxAmount + "</span>");
								scale.eq(platformIndex).children("span").eq(0).remove();
								scaleLeft += 50;
								scale.eq(platformIndex).css("left", scaleLeft);

							}
						}
						//往右拖曳
						if (distance > 0) {
							copyNum = parseInt((Math.abs(distance) + surplus2) / 50);
							surplus2 = Math.abs(distance) + surplus2 - copyNum * 50; //取整后的剩余部分；
							currentMinAmount = parseInt(scale.eq(platformIndex).children("span").eq(0).html());
							for (k = 0; k < copyNum; k++) {
								currentMinAmount -= stepAmount;
								if (currentMinAmount >= minAmount) {
									scale.eq(platformIndex).prepend("<span>" + currentMinAmount + "</span>"); //增加1个span，span的个数为24
								} else {
									currentMinAmount = minAmount;
									scale.eq(platformIndex).prepend("<span></span>");
								}
								scale.eq(platformIndex).children("span").eq(23).remove(); //增加了1个span后，span的个数为24
								scaleLeft -= 50;
								scale.eq(platformIndex).css("left", scaleLeft);
							}
						}
						flag = 1;
					}
				}
			},
		})
	}

})(jQuery, window, document);