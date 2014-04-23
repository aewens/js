var title = 'TITLE'

exports.index = function(req, res) {
	res.render('index', { title : title })
}
exports.partials = function (req, res) {
  var name = req.params.name;
  res.render('partials/' + name, { title : title });
};