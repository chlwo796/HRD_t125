

function inputCheck(){
	let frm = document.voteForm;
	if(frm.v_jumin.value==''){
		frm.v_jumin.focus();
		alert('주민번호가 입력되지 않았습니다!');
		return false;
	}
	if(frm.v_name.value==''){
		alert('성명이 입력되지 않았습니다!');
		frm.m_v_nameno.focus();
		return false;
	}
	
	if(frm.m_no.value==''){
		alert('투표번호가 선택되지 않았습니다!');
		frm.m_no.focus();
		return false;
	}
	if(frm.v_time.value==''){
		frm.v_time.focus();
		alert('투표시간이 입력되지 않았습니다!');
		return false;
	}
	
	if(frm.v_area.value==''){
		frm.v_area.focus();
		alert('투표장소가 입력되지 않았습니다!');
		return false;
	}
	let result = frm.v_confirm[0].checked==false && frm.v_confirm[1].checked==false;
	if(result){
		alert('유권자확인이 선택되지 않았습니다!');
		frm.v_confirm.focus();
		return false;
	}
	alert('투표하기 정보가 정상적으로 등록되었습니다!')
	return true;
}
function inputReset(){
	alert('정보를 지우고 처음부터 다시 입력합니다!');
	let frm = document.voteForm;
	frm.reset();
	frm.v_jumin.focus();
}