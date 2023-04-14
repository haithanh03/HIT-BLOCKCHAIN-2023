# Trình bày chi tiết về PoW, PoS và dPoS

**1.PoW (Proof of Work)**
- Proof of work: Là một cơ chế đồng thuận đòi hỏi một lượng nỗ lực tính toán đáng kể từ các mạng lưới thiết bị. Nó giúp xác nhận các giao dịch và tạo ra các khối mới để thêm vào chuỗi. PoW đặt ra độ khó và quy tắc cho công việc mà các miner thực hiện. 
- Cụ thể ở đây là miner sẽ tham gia vào các mining pool để thực hiện công việc đào (tìm số nonce). Và chỉ có thể thêm vào chuỗi khối mới khi số nonce tìm được là phù hợp.
- Về tính bảo mật cũng như xác nhận giao dịch: PoW hoàn toàn đảm bảo được điểu này. Khi có nhiều miner cùng tìm ra nonce, việc quyết định xem ai sẽ được thêm khối mới phụ thuộc vào tỉ lệ sức mạnh khai thác của họ. Điều đó có nghĩa là, nếu một ai đó muốn tấn công (tạo ra các khối giả mạo, duy trì một chuỗi thứ hai, thay đổi thông tin giao dịch, ...), thì họ phải nắm trên 50% sức mạnh khai thác để có thể đánh bại các miner khác. Điều này dường như là bất khả thi bởi để làm được điều đó, họ cần 1 nguồn lực không tưởng, thậm chí là lớn hơn rất nhiều những gì họ đạt được nếu tấn công thành công.
- PoW chịu trách nhiệm phát hành tiền tệ mới vào hệ thống và khuyến khích các thợ mỏ làm việc. Cụ thể là khi tạo ra được một khối mới, họ sẽ nhận được phần thưởng.

***Các ưu và nhược điểm của PoW:***

- Ưu điểm:
  - Có thể bắt đầu với 0 ETH
  - Dễ thực hiện hơn PoS
- Nhược điểm:
  - Tốn rất nhiều năng lượng
  - Cần nguồn đầu tư lớn ngay từ ban đầu.
  - Do độ khó ngày càng lớn, dẫn đến việc các nhóm miner nhỏ sẽ khó cạnh tranh hơn so với các nhóm lớn => Rủi ro về bảo mật cũng như mất đi tính phi tập trung.

**2.PoS (Proof of Stake)**
- Khái niệm: PoS là một cơ chế đồng thuận khác trong blockchain. Theo đó các nút xác thực được chọn ngẫu nhiên (trình xác thực) đặt cọc mã thông báo gốc (đặt cược) của mạng blockchain để đề xuất hoặc chứng thực các khối mới cho blockchain hiện tại. Trình xác thực sẽ nhận được phần thưởng bằng cách thêm thành công các khối vào blockchain.
- Cơ chế hoạt động: Bao gồm 2 phần riêng biệt:
  - Thứ nhất: Một nút xác thực gửi mã thông báo của nền tảng blockchain dưới dạng cổ phần. Trong PoS, nó luôn dành tỉ lệ ưu tiên cao hơn cho các nút có cổ phần cao hơn.
  - Thứ hai: Chọn trình xác thực để tạo mới một khối ngẫu nhiên. Một số cách để xác thực như:
    - Phương pháp ***Coin Age Selection***: Phương pháp này xác định "tuổi" của tiền xu, là thời gian tính từ lúc node xác thực đã đặt tiền + số tiền nó đã đặt cọc. Khi node được chọn làm trình xác thực, tuổi của nó được trả về 0.
    - Phương pháp ***Randomized block selection*** :Tập trung vào trình xác thực giữa cố phần cao nhất và giá trị băm thấp nhất. Mọi người tham gia đều có thể xem cổ phần được đưa ra bởi nút xác thực một cách minh bạch.
-Khi một node được chọn, node xác thực sẽ xác minh giao dịch trong khối (xem có hợp lệ hay không) => Ký khối. Nếu phần đông xác thực là hợp lệ, khối mới được tạo sẽ được đưa vào mạng lưới => nút trình xác thực sẽ nhận được phần thưởng.
- Nếu một block được xác định là lỗi (có gian lận) thì trình xác thực sẽ bị mất 1 phần cố phần và miner sẽ bị hạn chế các hoạt động đào trong tương lai.

- Tổng quan lại, ta có những điểm chính của PoS:
  - Tiết kiệm năng lượng hơn so với PoW
  - Với bằng chứng cổ phần (POS), chủ sở hữu tiền điện tử xác thực các giao dịch khối dựa trên số lượng tiền được đặt cọc.
  - Bằng chứng cổ phần (POS) được tạo ra để thay thế cho Proof-of-work (POW), cơ chế đồng thuận ban đầu được sử dụng để xác thực blockchain và thêm các khối mới.
  - Trong khi các cơ chế PoW yêu cầu thợ đào giải các câu đố mật mã, các cơ chế PoS yêu cầu người xác thực nắm giữ và đặt cọc mã thông báo để có đặc quyền kiếm phí giao dịch.
  - Bằng chứng cổ phần (POS) được coi là ít rủi ro hơn về khả năng tấn công trên mạng, vì nó cấu trúc bồi thường theo cách làm cho một cuộc tấn công ít thuận lợi hơn.
  - Người viết khối tiếp theo trên blockchain được chọn ngẫu nhiên, với tỷ lệ cược cao hơn được gán cho các nút có vị trí cổ phần lớn hơn.

**3.dPoS (Delegated Proof-of-Stake)**
- Khái niệm: Là một biến thể của cơ chế đồng thuận PoS, trong đó người dùng vẫn sẽ đặt cọc tiền điện tử của họ làm tài sản thế chấp. Tuy nhiên, thay vì tự chịu trách nhiệm xác thực khối, họ sẽ bỏ phiếu để chọn ra node thực hiện việc xác định khối thay mặt cho họ (còn gọi cách khác là ủy quyền). Khi các nút đã được chọn, chúng sẽ có nhiệm vụ đạt được sự đồng thuận giữa chúng để xác thực giao dịch và đưa khối mới vào mạng lưới.
- Sử dụng DPoS, bạn có thể bỏ phiếu cho các nút bằng cách gộp các đồng tiền điện tử của mình vào một nhóm đặt cọc và liên kết chúng với một nút cụ thể. Bạn không bắt buộc phải chuyển mã thông báo của mình sang ví khác mà thay vào đó sử dụng nhà cung cấp dịch vụ đặt cọc để đặt cọc mã thông báo của bạn trong nhóm đặt cọc.
- **Bỏ phiếu**: Bỏ phiếu là thành phần quan trọng nhất của DPoS. Người dùng / các bên liên quan 'bỏ phiếu' để chọn các nút mà họ tin tưởng để xác thực giao dịch và các nút đã thu thập được nhiều phiếu bầu nhất sẽ có quyền xác thực giao dịch. Người dùng cũng có thể ủy thác quyền biểu quyết của họ cho những người dùng khác được gọi là đại biểu, người mà họ tin tưởng để bỏ phiếu cho các nút thay mặt họ. Người dùng phải đặt cọc tiền xu để bỏ phiếu. Các đồng tiền được đặt cọc được khóa trong các hợp đồng thông minh trong các vòng bỏ phiếu. Phiếu bầu được tính trọng số theo quy mô cổ phần của mỗi người dùng. Nhiều đồng tiền hơn chuyển thành nhiều phiếu bầu hơn. Người dùng được phép một phiếu bầu cho mỗi nút. Nhưng anh ta có thể bỏ phiếu cho nhiều nút. Sau khi tất cả các giao dịch trong một khối được xác minh, các nhân chứng sẽ nhận được phần thưởng sau đó được chia sẻ với mọi người dùng đã bỏ phiếu cho nhân chứng đó.
![Bỏ_Phiếu](https://media.licdn.com/dms/image/D5612AQGgbZN7588POA/article-inline_image-shrink_1000_1488/0/1678192082583?e=1686787200&v=beta&t=-4AFZah-Jo4VrYFmRRLg3t2IQlL0g-a8NjALT05Pn1c)
- **Nhà sản xuất khối/Người chứng kiến**: 
  - Các khối được tạo ra bởi các nhân chứng lần lượt. Một nhân chứng phải có đủ số phiếu để được bầu. Một số lượng nhân chứng giới hạn từ 20 đến 100 được chọn ngẫu nhiên cho mỗi khối mới. Một trong những nhân chứng được chọn, 1 nhân chứng tạo ra khối cùng một lúc và những người khác tham gia đồng thuận. Nhưng mỗi nhân chứng được trao một cơ hội để tạo ra một khối.
- Vì có số lượng trình xác thực hạn chế, DPoS cho phép mạng đạt được sự đồng thuận nhanh hơn.
- Mặc dù một nhân chứng có thể giữ một số giao dịch nhất định ra khỏi một khối, họ không thể thay đổi thông tin của giao dịch.

**Điều gì làm cho các nhân chứng đáng tin cậy?**
- Điều quan trọng cần lưu ý là bỏ phiếu là một quá trình thời gian thực và liên tục, có nghĩa là các nhân chứng có thể bị không được bỏ phiếu nếu nhân chứng được chọn không thực hiện và không xác thực các giao dịch trong thời gian quy định. Nếu khối bị bỏ lỡ, có nghĩa là không có giao dịch nào được xác minh, thì nó sẽ được chuyển cho nhân chứng hoạt động tiếp theo. Ngoài ra, phần thưởng của khối bị bỏ lỡ sẽ được trao cho nhân chứng tích cực tiếp theo, người cuối cùng xác minh tất cả các giao dịch trong khối đó. Khi điều này xảy ra, khối được coi là bị đánh cắp. Nếu khối bị bỏ lỡ thường xuyên bởi một nhân chứng, nó được coi là không hoạt động và có thể bị đuổi khỏi mạng. Sau đó, các bên liên quan bỏ phiếu cho một nhân chứng mới.
- Mặt khác, nếu các nhân chứng bị phát hiện không trung thực với mạng lưới, họ sẽ mất những gì họ đã đặt cược. Việc bầu chọn các nút dựa trên danh tiếng của họ. Nếu nút hoạt động tốt, giá trị danh tiếng của nó sẽ tăng dần; Nếu không, giá trị danh tiếng sẽ giảm dần. Danh tiếng quyết định độ tin cậy của một nút. Vì vậy, rõ ràng, các nút có danh tiếng tốt được ưu tiên để được bình chọn bởi người dùng. Ngoài ra, danh tiếng cũng là động lực chính chống lại hành vi độc hại. Do đó, lợi ích tốt nhất của các nhân chứng là trở thành một thành viên có giá trị của cộng đồng để tránh bị thay thế.

**Ưu và nhược điểm của DPoS**
- Ưu điểm: 
  - Khả năng xử lí giao dịch nhanh hơn PoW và PoS do đạt được sự đồng thuận nhanh hơn => Có khả năng mở rộng hơn và có thể được sử dụng cho nhiều ứng dụng.
  - Các nhân chứng sẽ mất quyền đặt nếu họ thực hiện các hành vi độc hại => Động lực để họ thực hiện vai trò của mình một cách trung thực.
  - Không cần thiết bị chuyên dụng để trở thành người dùng, nhân chứng hoặc người xác thực khối. Một máy tính bình thường với sức mạnh tính toán tốt là đủ.
  - Chúng tiết kiệm năng lượng, tiết kiệm chi phí và thân thiện với môi trường so với các thuật toán băm PoW.
- Nhược điểm:
  - Có một nhóm nhỏ các nhân chứng được bầu có thể làm cho DPoS dễ bị tập trung hóa
  - Bởi vì ít nút / nhân chứng hơn (20-100) chịu trách nhiệm giữ cho mạng tồn tại, nên việc tổ chức một cuộc tấn công 51% sẽ dễ dàng hơn.
  - Sức mạnh bỏ phiếu được xác định bởi số lượng mã thông báo mà các cá nhân có, có nghĩa là những người sở hữu nhiều mã thông báo hơn sẽ ảnh hưởng đến mạng nhiều hơn những người sở hữu rất ít. Do đó, người dùng DPoS có cổ phần nhỏ sẽ có ít động lực bỏ phiếu hơn vì họ có thể nghĩ rằng phiếu bầu của họ không quan trọng so với phiếu bầu của các bên liên quan lớn hơn. Do đó, sự tham gia thấp vào quá trình bỏ phiếu có thể tạo ra sự tập trung hơn nữa trong mạng bằng cách đặt quyền lực vào tay một số lượng hạn chế chủ sở hữu tiền xu.






