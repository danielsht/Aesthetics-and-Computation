class JSONBS {
  JSONObject json;

  int getTemp(String URL) {
    int temp;
    json = loadJSONObject(URL);

    JSONObject query = json.getJSONObject("query");
    JSONObject results = query.getJSONObject("results");
    JSONObject channel = results.getJSONObject("channel");
    JSONObject item = channel.getJSONObject("item");
    JSONObject condition = item.getJSONObject("condition");
    String sTemp = condition.getString("temp");
    temp = int(sTemp);
    return temp;
  }
}