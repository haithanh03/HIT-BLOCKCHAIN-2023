# Bài tập về nhà tuần 2:

**1. Trình bày về hashing function và SHA-256**

***Hash function là gì?***
 
 Hiểu một cách đơn giản, hash function là một hàm thực hiện công việc " băm " dữ liệu để chuyển dữ liệu về dạng đã được mã hóa!

 ***SHA-256 là gì?***

 SHA-256 là một trong những hash function phổ biến nhất được sử dụng hiện nay. Bản thân nó là một hàm băm *bất đối xứng*. Nó chuyển đổi một chuỗi data thành một chuỗi băm có độ dài 256 bit. SHA-256 có nhiều tính chất: Tính kháng va chạm, tính 1 chiều, tính không dự đoán được, tính bảo mật cao, ...

 **2.Trình bày về mã hóa đối xứng (symmetric cryptography) + bất
đối xứng (asymmetric cryptography ) + lấy ví dụ từng loại ?**

***Mã hóa đối xứng:***

![symmetric cryptography](https://th.bing.com/th/id/R.8101c029a9135f183068162034e3a1d6?rik=63S6KBusTI0hPg&pid=ImgRaw&r=0)

- Đây là một kĩ thuật mã hóa khá đơn giản, ít phức tạp hơn và tốc độ thực thi nhanh.
- Hiểu nôm na: Ta sử dụng một key để mã hóa data gửi đi, và ta sử dụng chính key đó để giải mã.

***Mã hóa bất đối xứng***

![asymetric crytography](https://th.bing.com/th/id/R.7e84ee563c493c60282585f3ecf23197?rik=jb4Xm8CFE0VNBw&pid=ImgRaw&r=0)

- Mã hóa bất đối xứng an toàn hơn so với mã hóa đối xứng do nó sử dụng hai key khác nhau trong việc mã hóa và giải mã.
- Hai key có tính chất tương đương nhau:Khi một data được mã hóa bằng public key thì nó chỉ được giải mã bằng private key và ngược lại, nếu data được mã hóa bằng private key thì nó cũng sẽ được giải mã bằng public key.
- Public key được để công khai, tuy nhiên private key thì là bí mật :v
- Tuy an toàn nhưng mã hóa bất đối xứng có nhược điểm là xử lí mất nhiều thời gian hơn so với mã hóa đối xứng.

>Tóm cái váy lại, lựa chọn tối ưu để bảo mật vẫn sẽ là mã hóa bất đối xứng

**3.Trình bày cấu trúc chung và giải thích các thành phần của một block**

![block](https://th.bing.com/th/id/R.7f787432b545e624c470b7087d59a60c?rik=IlCPy1DRx5BZkw&pid=ImgRaw&r=0)

***3.1 Block size***

- Blocksize: Kích thước của một khối là lượng dữ liệu mà nó có khả năng lưu trữ. Một khối có thể chứa rất nhiều thông tin
>Kích thước của khối trong bitcoin được giới hạn 1MB tuy nhiên nó có thể lưu trữ tới hơn 2000 giao dịch.

***3.2 Block header***

* Version: là phiên bản số của phần mềm. Một công cụ khai thác với phiên bản số cụ thể có thể báo hiệu quyết định giao thức nào mà người đó hỗ trợ.

* Timestamp: Là một chuỗi các chữ số đại diện cho ngày hoặc là thời gian được tạo của các sự kiện hoặc các tài liệu kĩ thuật số. Lợi ích của timestamp: 
  * * Chúng đáng tin cậy và an toàn hơn, vì chúng không thể thay đổi hoặc xóa sau khi được xuất bản vào sổ cái.
  * * Blockchain được phân cấp, giúp giảm thiểu khả năng giả mạo bởi bất kỳ một bên nào.z
  * * Dấu thời gian có thể được xem hoàn toàn minh bạch nếu muốn.

* Merkle root: Bản chất nó là một hàm băm. Nó được sử dụng để đảm bảo các khối dữ liệu được truyền trong mạng ngang hàng là toàn bộ, tức là không bị thay đổi hay hỏng. 
* Merkle tree: Là một dạng các hàm băm được liên kết theo cấu trúc của cây sao cho mỗi hàm băm được liên kết với các hàm cha, hàm tổ tiên, ... Tất cả các hàm băm giao dịch trong khối đều được băm, sau cùng chuyển đến gốc hay còn gọi là Merkle Root
![merkle](https://3.bp.blogspot.com/-DZnmbCxwHSc/VuBk48kRGYI/AAAAAAAAAaY/VDlJs0BcOJQ/s1600/MerkleTree.jpg)

* Nonce: Là một chuỗi số nguyên 32 bit ngẫu nhiên. Nonce giúp cho chuỗi hash hoàn chỉnh, bảo mật và dễ dàng kết nối với các khối trong mạng lưới. 
* * Khi tìm được nonce của 1 khối tức là block đó đã được hoàn thiện, các giao dịch khác không thể thêm vào trong hệ thống dữ liệu của block đó -> Nonce góp phần hoàn thiện hệ thống.
* * Để thay đổi và hợp lệ hóa chuỗi thì cần phải thay đổi hoặc tìm được nonce phù hợp -> khó để các hacker tấn công.
* Previuos hash: là mã hash của block phía trước. Ở block đầu tiên thì pre hash = 0;
* Difficult target: Ý nghĩa ngay từ cái tên, nó cho biết độ khó của mục tiêu. Mục tiêu ở đây là tìm ra một hàm băm thỏa mãn. Độ khó có thể đo bằng tốc độ băm mỗi giây. Nó là một khía cạnh vô cùng quan trọng của mạng bởi nó xác định lượng điện năng cần thiết để khai thác một khối. -> Yếu tố tạo nên giá trị của bitcoin.
* Transaction data: Trường dữ liệu chứa thông tin về dữ liệu và các giao dịch. Trường dữ liệu này sau khi mã hóa sẽ được lưu trữ trên mạng lưới của blockchain -> Xác định tính hợp lệ của giao dịch.
* Transaction counter: Trường đếm số lượng các giao dịch trong một hệ thống mạng -> Ngăn ngừa trùng lặp, gian lận. Ngoài ra, nó còn dùng để theo dõi khối lượng giao dịch, đối chiếu tài khoản và tạo báo cáo.



















3.1 Block size ?
3.2 Block Header ( version , timestamp , merkle root (giải thích
về merkle tree ) , nonce , previous hash , difficult target ) ?
3.3 Transaction data ?
3.4 Transaction counter ?



