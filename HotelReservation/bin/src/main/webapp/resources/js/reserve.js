const SERVER_ADDRESS = 'http://localhost:8080'
// 체크인 날짜 입력 시 체크아웃 날짜 자동 조정
// function setCheckoutDate(){
//     var checkin = document.getElementById('checkin')
//     var checkout = document.getElementById('checkout')

//     checkout.value = checkin.value
//     checkout.stepUp()
//     checkout.min = checkout.value
//     console.log(checkout.min)
//     setPrice()
//     checkDate()
//  }
// 숙박 일수에 따른 가격 측정
function setPrice(start, end){
    var checkinDate = start
    var checkoutDate = end
    var basePrice = document.getElementById('basePrice').value

    var checkinDateSplit = checkinDate.split('-')
    var checkoutDateSplit = checkoutDate.split('-')
    var checkin = new Date(
                checkinDateSplit[0], 
                checkinDateSplit[1], 
                checkinDateSplit[2])
    var checkout = new Date(
                checkoutDateSplit[0], 
                checkoutDateSplit[1], 
                checkoutDateSplit[2])           
    
    var diff = checkout-checkin
    var mDay = 24 * 60 * 60 * 1000
    var day = diff / mDay
    var price = basePrice * day

    var priceElement = document.getElementById('priceField')
    var priceInput = document.getElementById('price')

    priceElement.innerText = price.toLocaleString('ko-kr');
    priceInput.value = price

    checkDate(start, end)
 }
// 예약 가능 여부 확인
function checkDate(start, end){
    var seq = document.getElementById('seq').value
    var dateCheck = document.getElementById('dateCheck')
    var dateCheckMsg = document.getElementById('dateCheckMsg')
    var checkinDate = start
    var checkoutDate = end
    $.ajax({
        url:`${SERVER_ADDRESS}/hotel/reservation/datecheck`,
        type:'post',
        data:{roomSeq: seq,
            checkin: checkinDate,
            checkout: checkoutDate
        },
        success: function(result){
            if(result == true){
                dateCheck.value = 1
                dateCheckMsg.style.color='green'
                dateCheckMsg.innerText = '예약 가능합니다.'
            }else{
                dateCheck.value = 0
                dateCheckMsg.style.color='red'
                dateCheckMsg.innerText = '예약 가능한 방이 없습니다.'
            }
        }
    });
}

function submitCheck(){
    var dateCheck = document.getElementById('dateCheck')
    if(dateCheck.value == 1){
        if(confirm(`예약 정보를 한번 더 확인해보시기 바랍니다.\n입력 정보에 문제가 없다면 확인 버튼을 눌러주세요.`)){
            alert(`예약이 완료되었습니다.\n이용해 주셔서 감사합니다.`)
            return true
        }
    }
    alert('체크인 / 체크아웃 일자를 확인해주세요.')
    return false
}

function dateRangePicker(){
    $('daterange').daterangepicker();
}