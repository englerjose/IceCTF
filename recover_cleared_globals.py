dict = {}.__class__
list = [].__class__
tuple = ().__class__
str = ''.__class__
unicode = u''.__class__
basestring, = unicode.__bases__
True = 1 == 1
False = not True
bool = True.__class__
type = bool.__class__
int = type(1)
long = type(1L)
object, = long.__bases__
