<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jquery - xml</title>
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>
<style>
table {border : 1px solid #000; border-collapse: collapse; margin: 10px 0;}
th, td {border : 1px solid #000; text-align: center; padding: 3px; }
table img {width: 100px;}
</style>
</head>
<body>
	<h1>xml</h1>
	<button id="btn1">sample</button>
	<table id="tbl-books">
		<thead>
			<tr>
				<th>분류</th>
				<th>제목</th>
				<th>저자</th>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
	<script>
	btn1.addEventListener('click', () => {
		$.ajax({
			url : "<%= request.getContextPath() %>/jquery/sample.xml",
			method : "GET",
			dataType : "xml",
			success(doc){
				// 응답받은 xml을 jquery가 parsing처리후 DOM으로 전달. 
				console.log(doc);
				console.dir(doc); // document
				
				const root = doc.querySelector(":root"); // books태그
				console.dir(root);
				
				// 사용자 속성가져오기
				console.log(root.myattr); // undefined root.attributes(NamedNodeMap타입)속성에서 관리됨.
				console.log(root.getAttribute("myattr")); // hello
				
				const tbody = document.querySelector("#tbl-books tbody");
				tbody.innerHTML = "";
				
				const books = [...root.children]; // Array.from(유사배열)
				console.log(books);
				books.forEach((book) => {
					const [subject , title, author] = book.children;
					// console.log(subject, title, author);
					tbody.innerHTML += `<tr>
						<td>\${subject.textContent}</td>
						<td>\${title.textContent}</td>
						<td>\${author.textContent}</td>
					</tr>`;
				});
				
			},
			error : console.log
		});
	});
	</script>
	
	<hr />
	
	<button id="btn2">celeb</button>
	<table id="tbl-celeb">
		<thead>
			<tr>
				<th>No</th>
				<th>이름</th>
				<th>타입</th><!-- select태그 하위에 해당타입이 selected 처리 -->
				<th>프로필</th><!-- img태그처리 -->
			</tr>
		</thead>
		<tbody></tbody>
	</table>
	<script>
	btn2.addEventListener('click', () => {
		$.ajax({
			url : "<%= request.getContextPath() %>/jquery/xml",
			// dataType : "xml", // 응답데이터를 보고 자동으로 지정
			success(doc){
				console.log(doc);
				const root = doc.querySelector(":root"); // celebs태그
				console.log(`총 \${root.getAttribute("len")}개의 데이터가 조회되었습니다.`);
				
				const celebs = [...root.children]; // 전개 연산자
				document.querySelector("#tbl-celeb tbody").innerHTML = 
					celebs.reduce((html, celeb) => {
						const [name, type, profile] = celeb.children; // iterator를 상속(진짜배열, 유사배열)
						const tr = `<tr>
							<td>\${celeb.getAttribute("no")}</td>
							<td>\${name.textContent}</td>
							<td>\${type.textContent}</td>
							<td>
								<img src="<%= request.getContextPath() %>/images/\${profile.textContent}"/>
							</td>
						</tr>`;
						return html + tr;
					}, "");
			},
			error : console.log
		});
	});
	</script>
	
	<hr />
	<h2>일일 박스오피스 조회</h2>
	<div><input type="date" name="targetDt" id="targetDt" /></div>
	
	
	
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
</body>
</html>