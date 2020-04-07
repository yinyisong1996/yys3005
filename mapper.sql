-- AuthorMapper.xml
 <select id="queryAllAuthor" resultType="Author">
-- return author
        select * from author
    </select>

    <select id="queryAuthorByName" resultType="Author">
-- find author by name
        select * from author where auther_name = #{auther_name}
    </select>

    <select id="queryAuthorById" resultType="Author">
-- find author by id
        select * from author where auther_id = #{auther_id}
    </select>

    <update id="updateAuthorMoney">
-- update author money
        update author set money=#{money} where auther_id = #{auther_id}
    </update>

-- BookMapper.xml
 <select id="findAllBooks" resultType="Book">
-- query all books
        select * from book
    </select>

    <select id="queryBookById" resultType="Book">
-- query all books by id
-- left join 2 tables and query from them
        SELECT b.bid,b.bname,b.price,b.bimage,b.cid,b.del,b.page,b.ISBN,b.author_id,b.stock,a.auther_name FROM book b LEFT JOIN author a on b.author_id = a.auther_id WHERE bid = #{bid}
    </select>

    <select id="queryBookStockById" resultType="int">
-- query all books stock by id
        SELECT stock FROM book WHERE bid = #{bid}
    </select>

    <update id="updateBookstockById">
-- update book stock by id
        update book set stock=#{count} where bid=#{bid}
    </update>

    <select id="queryByCategory" resultType="Book">
-- query all category by id
        select * from book where cid = #{cid}
    </select>

    <update id="updateBook">
-- update book stock by id
        update book set bname=#{bname},price=#{price},author_id=#{author_id},cid=#{cid} where bid=#{bid}
    </update>

    <delete id="deleteBookById">
-- delete book by id
        delete from book where bid=#{bid}
    </delete>

    <insert id="addBook">
-- add book
       insert into book values(#{bid},#{bname},#{price},#{bimage},#{cid},#{del},#{page},#{ISBN},#{author_id},#{stock},#{sales})
    </insert>


    <select id="searchBookByItem" resultType="Book">
-- search book by name, isbn, author, category
        SELECT b.bid,b.bname,b.price,b.bimage,b.cid,b.del,b.page,b.ISBN,b.author_id,b.stock,b.sales,a.auther_name,c.cname FROM book b LEFT JOIN author a on b.author_id = a.auther_id LEFT JOIN category c on b.cid = c.cid WHERE b.bname LIKE #{search} or b.ISBN LIKE #{search} or a.auther_name LIKE #{search} or c.cname LIKE #{search}
    </select>

-- CategoryMapper.xml
  <select id="queryAllCategory" resultType="Category">
-- query all categories
        select * from category
    </select>

    <delete id="deleteCategory">
-- delete categories by cid
        delete from category where cid=#{cid}
    </delete>

    <update id="updateCategory">
-- update categories by id
        update category set cname=#{cname} where cid=#{cid}
    </update>

    <select id="queryCategoryById" resultType="Category">
-- query category by id
        select * from category where cid=#{cid}
    </select>

    <insert id="addCategory">
-- add category
       insert into category values(#{cid},#{cname})
    </insert>

-- OrderItemMapper.xml
  <insert id="addOrderItemList">
-- add order id
        insert into orderitem values(#{itemID},#{count},#{subtotal},#{oid},#{bid})
    </insert>

    <select id="queryOrderItemByOid" resultType="OrderItem">
-- query order item by order id
        select * from orderitem where oid = #{oid}
    </select>

    <delete id="deleteOrderItemByOid">
-- delete order item by order id
        delete from orderitem where oid = #{oid}
    </delete>

-- OrderMapper.xml
  <insert id="addOrderItem">
-- add order item
        insert into orderitem values(#{itemID},#{count},#{subtotal},#{oid},#{bid})
    </insert>
    
    <insert id="addOrder">
-- add order
        insert into orders values (#{oid},#{ordertime},#{alltotal},#{uid},#{address},#{state})
    </insert>

    <select id="queryOrderByUid" resultType="Order">
-- query order by user id
        select * from orders where uid = #{uid}
    </select>

    <select id="queryOrderItemByOrder" resultType="OrderItem">
-- query order item by order number
        select * from orderitem where oid = #{oid}
    </select>

    <select id="queryOrderByOid" resultType="Order">
-- query entire order by order number
        select * from orders where oid = #{oid}
    </select>

    <update id="updateOrderState" parameterType="String">
-- update status
        update orders set state = '2' where oid=#{oid}
    </update>


    <update id="updateOrderStateConfirm" parameterType="String">
-- update status to confirm
        update orders set state = '4' where oid=#{oid}
    </update>

    <delete id="deleteOrderByOid">
-- delete order by order number
        delete from orders where oid = #{oid}
    </delete>

-- StoreUserMapper.xml
 <select id="findStoreUserById" resultType="StoreUser">
-- query customer info by id
        select * from store_user where uid=#{uid}
    </select>


    <insert id="addStoreUser">
        insert into store_user values (#{uid},#{uname},#{account_name},#{gener},#{phone},#{email},#{address})
    </insert>

-- UserMapper.xml
 <select id="selectByName" resultType="User">
-- query customer by user_id
        select * from pe_user where username = #{username}
    </select>

    <select id="selectRolesByName" resultType="String">
-- query role and authentication
        SELECT NAME FROM pe_role WHERE id IN (SELECT role_id FROM pe_user_role WHERE user_id IN( SELECT id FROM pe_user WHERE username=#{username}))
    </select>

    <select id="selectPremsByName" resultType="String">
-- query permission by name
        SELECT CODE FROM pe_permission WHERE id IN (SELECT permission_id FROM pe_role_permission WHERE role_id IN (SELECT role_id FROM pe_user_role WHERE user_id IN( SELECT id FROM pe_user WHERE username=#{username})))
    </select>

    <insert id="addUser">
        insert into pe_user values (#{id},#{username},#{password})
    </insert>