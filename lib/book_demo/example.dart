
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/book_demo/book_model.dart';

import 'book_item.dart';
import 'book_manager_model.dart';

class ChangeNotifierProxyProviderExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChangeNotifierProxyProviderExampleState();
  }
  
}

class _ChangeNotifierProxyProviderExampleState extends 
  State<ChangeNotifierProxyProviderExample> {

  var _selectIndex = 0;
  var _pages = [PageA(), PageB()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectIndex,
        onTap: (index) {
          setState(() {
            _selectIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: '书籍列表'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: '收藏列表'
          ),
        ],
      )
    );
  }
}

class PageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var bookModel = Provider.of<BookModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("书籍列表"),),
      body: ListView.builder(
        itemCount: bookModel.length,
        itemBuilder: (_, index) => BookItem(id: index + 1),
      ),
    );
  }
}

class PageB extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    var bookManagerModel = Provider.of<BookManagerModel>(context);
    var bookCount = bookManagerModel.length;

    return Scaffold(
      appBar: AppBar(title: Text("书籍列表"),),
      body: ListView.builder(
        itemCount: bookCount,
        itemBuilder: (_, index) => BookItem(id: bookManagerModel.getByPosition(index).bookId),
      ),
    );

  }
}
