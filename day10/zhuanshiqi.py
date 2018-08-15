def foo(f):
    def inner(*args):
        return 'msg'
    return inner


@foo
def chek(x, y):
    return x + y


print(chek(1, 2))
