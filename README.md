# appFlutter_TCC

```
return Container(

                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(16),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,

                  decoration: BoxDecoration(
                    //color: Color.fromRGBO(16, 25, 50, 1),
                    borderRadius: BorderRadius.circular(16)
                  ),    
                  
child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,

                    children: [
                      Expanded(
                        child: ListView.builder(

                          itemCount: figurinha.length,
                          padding: EdgeInsets.all(5),
                          itemBuilder: (BuildContext ctx, index){

                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,

                              children: [
                                Padding(padding: EdgeInsets.all(16)),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 2
                                    )
                                  ),
                                  child: GestureDetector(
                                    onTap: () => Navigator.push(
                                      context, 
                                      MaterialPageRoute(
                                        builder: (context) => const FiguraPag(),
                                        settings: RouteSettings(
                                          arguments: figurinha[index]
                                        )
                                      )
                                    ),
                                    child: Image.asset(figurinha[index].figura, width: 150, height: 200),
                                  ),
                                ),
                              ],
                            );
                          }
                        )
                      )
                    ],
                  ),
```
