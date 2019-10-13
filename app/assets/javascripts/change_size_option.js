$(function () {

  function change_size_option(id) {
    switch(id) {
      // レディース
      case '15':
      case '16':
      case '17':
      case '18':
      case '19':
      case '20':
      case '21':
      case '22':
      case '23':
      case '24':
      case '25':
      case '26':
      case '27':
      case '28':
      case '29':
      case '30':
      case '31':
      case '32':
      case '34':
      case '35':
      case '36':
      case '37':
      case '38':
      case '39':
      case '40':
      case '41':
      case '42':
      case '43':
      case '44':
      case '45':
      case '46':
      case '47':
      case '48':
      case '49':
      case '50':
      case '51':
      case '52':
      case '53':
      case '54':
      case '56':
      case '57':
      case '58':
      case '59':
      case '60':
      case '61':
      case '62':
      case '63':
      case '64':
      case '65':
      case '66':
      case '67':
      case '69':
      case '70':
      case '71':
      case '72':
      case '73':
      case '75':
      case '76':
      case '77':
      case '78':
      case '91':
      case '92':
      case '93':
      case '95':
      case '96':
      case '97':
      case '98':
      case '99':
      case '20':
      case '21':
      case '22':
      case '23':
      case '24':
      case '25':
      case '26':
      case '27':
      case '28':
      case '29':
      case '30':
      case '31':
      case '32':
      case '34':
      case '35':
      case '36':
      case '37':
      case '38':
      case '39':
      case '40':
      case '41':
      case '42':
      case '43':
      case '44':
      case '45':
      case '46':
      case '47':
      case '48':
      case '49':
      case '50':
      case '51':
      case '52':
      case '53':
      case '54':
      case '56':
      case '57':
      case '58':
      case '59':
      case '60':
      case '61':
      case '62':
      case '63':
      case '64':
      case '65':
      case '66':
      case '67':
      case '69':
      case '70':
      case '71':
      case '72':
      case '73':
      case '75':
      case '76':
      case '77':
      case '78':
      case '91':
      case '92':
      case '93':
      case '187':
      case '188':
      case '189':
      case '192':
      case '193':
      case '194':
      case '200':
      case '201':
      case '202':
      case '203':
      case '204':
      case '205':
      case '206':
      case '207':
      case '208':
        //メンズ

      case '214':
      case '215':
      case '216':
      case '217':
      case '218':
      case '219':
      case '220':
      case '221':
      case '223':
      case '224':
      case '225':
      case '227':
      case '228':
      case '229':
      case '230':
      case '231':
      case '232':
      case '233':
      case '234':
      case '235':
      case '236':
      case '237':
      case '238':
      case '239':
      case '240':
      case '241':
      case '242':
      case '243':
      case '244':
      case '245':
      case '246':
      case '247':
      case '248':
      case '249':
      case '251':
      case '252':
      case '253':
      case '254':
      case '256':
      case '257':
      case '258':
      case '259':
      case '283':
      case '284':
      case '285':
      case '286':
      case '287':
      case '343':
      case '344':
        $('#size__select__box').css('display', 'block');
        $('#size_select_size_select').empty();
        $('#size_select_size_select').append(`
            <option value="">---</option>
            <option value="153">XXS以下</option>
            <option value="154">XS(SS)</option>
            <option value="2">S</option>
            <option value="3">M</option>
            <option value="4">L</option>
            <option value="5">XL(LL)</option>
            <option value="155">2XL(3L)</option>
            <option value="156">3XL(4L)</option>
            <option value="157">4XL(5L)以上</option>
            <option value="7">FREE SIZE</option>
        `);
      break;
          // レディース靴
      case '80':
      case '81':
      case '82':
      case '83':
      case '84':
      case '85':
      case '86':
      case '87':
      case '88':
      case '89':
        $('#size__select__box').css('display', 'block');
        $('#size_select_size_select').empty();
        $('#size_select_size_select').append(`
          <option value="">---</option>
          <option value="144">20cm以下</option>
          <option value="145">20.5cm</option>
          <option value="146">21cm</option>
          <option value="147">21.5cm</option>
          <option value="148">22cm</option>
          <option value="16">22.5cm</option>
          <option value="17">23cm</option>
          <option value="18">23.5cm</option>
          <option value="19">24cm</option>
          <option value="20">24.5cm</option>
          <option value="21">25cm</option>
          <option value="22">25.5cm</option>
          <option value="149">26cm</option>
          <option value="150">26.5cm</option>
          <option value="151">27cm</option>
          <option value="152">27.5cm以上</option>
        `);
      break;
          //メンズ靴
      case '261':
      case '262':
      case '263':
      case '264':
      case '265':
      case '266':
      case '267':
      case '268':
        $('#size__select__box').css('display', 'block');
        $('#size_select_size_select').empty();
        $('#size_select_size_select').append(`
          <option value="">---</option>
          <option value="133">23.5cm以下</option>
          <option value="134">24cm</option>
          <option value="135">24.5cm</option>
          <option value="136">25cm</option>
          <option value="137">25.5cm</option>
          <option value="9">26cm</option>
          <option value="10">26.5cm</option>
          <option value="11">27cm</option>
          <option value="12">27.5cm</option>
          <option value="13">28cm</option>
          <option value="138">28.5cm</option>
          <option value="139">29cm</option>
          <option value="140">29.5cm</option>
          <option value="141">30cm</option>
          <option value="142">30.5cm</option>
          <option value="143">31cm以上</option>
        `);
      break;
          // べびー95

          case '15':
              case '359':
              case '360':
              case '361':
              case '362':
              case '363':
              case '364':
              case '365':
              case '366':
              case '367':
              case '368':
              case '369':
              case '371':
              case '372':
              case '373':
              case '374':
              case '375':
              case '376':
              case '377':
              case '378':
              case '380':
              case '381':
              case '382':
              case '383':
              case '384':
              case '385':
              case '386':
              case '387':
          $('#size__select__box').css('display', 'block');
          $('#size_select_size_select').empty();
          $('#size_select_size_select').append(`
            <option value="">---</option>
            <option value="56">60cm</option>
            <option value="57">70cm</option>
            <option value="58">80cm</option>
            <option value="59">90cm</option>
            <option value="60">95cm</option>
          `);
          break;
          // べびー100
          case '389':
          case '390':
          case '391':
          case '392':
          case '393':
          case '394':
          case '395':
          case '396':
          case '397':
          case '398':
          case '399':
          case '400':
          case '401':
          case '402':
          case '403':
          case '404':
          case '405':
          case '406':
          case '408':
          case '409':
          case '410':
          case '411':
          case '412':
          case '413':
          case '414':
          case '415':
          case '416':
          case '417':
          case '418':
          case '419':
          case '420':
          case '421':
          case '423':
          case '424':
          case '425':
          case '426':
          case '427':
          case '428':
          case '429':
          case '430':
        $('#size__select__box').css('display', 'block');
        $('#size_select_size_select').empty();
        $('#size_select_size_select').append(`
        <option value="">---</option>
        <option value="40">100cm</option>
        <option value="41">110cm</option>
        <option value="42">120cm</option>
        <option value="43">130cm</option>
        <option value="44">140cm</option>
        <option value="45">150cm</option>
        <option value="55">160cm</option>
        `);
      break;
          // ベビー靴
      case '432':
      case '433':
      case '432':
      case '435':
      case '436':
        $('#size__select__box').css('display', 'block');
        $('#size_select_size_select').empty();
        $('#size_select_size_select').append(`
          <option value="">---</option>
          <option value="47">10.5cm以下</option>
          <option value="48">11cm・11.5cm</option>
          <option value="49">12cm・12.5cm</option>
          <option value="50">13cm・13.5cm</option>
          <option value="51">14cm・14.5cm</option>
          <option value="52">15cm・15.5cm</option>
          <option value="53">16cm・16.5cm</option>
          <option value="54">17cm以上</option>
        `);
      break;
      //タイヤ
      case '1210':
      case '1211':
      case '1212':
      case '1213':
        $('#size__select__box').css('display', 'block');
        $('#size_select_size_select').empty();
        $('#size_select_size_select').append(`
          <option value="">---</option>
          <option value="158">12インチ</option>
          <option value="67">13インチ</option>
          <option value="68">14インチ</option>
          <option value="69">15インチ</option>
          <option value="70">16インチ</option>
          <option value="71">17インチ</option>
          <option value="72">18インチ</option>
          <option value="73">19インチ</option>
          <option value="74">20インチ</option>
          <option value="75">21インチ</option>
          <option value="159">22インチ</option>
          <option value="160">23インチ</option>
          <option value="161">24インチ</option>
        `);
      break;
      // それ以外（サイズがいらない）
      default:
        $('#size_select_size_select').empty();
        $('#size__select__box').css('display', 'none');
      break;
    };

  };

  $('#item_category_id').change(function(){
    var id = $(this).val();
    console.log(id);
    change_size_option(id)

  });
});

