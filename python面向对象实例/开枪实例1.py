class Person(object):
    """创建一个人类"""

    def __init__(self, name):
        self._name = name  # 人类绑定名字属性
        self._gun = None
        self._hp = 100

    def bulletToClip(self, bullet, clip):
        clip.preseBullet(bullet)

    def clipToGun(self, gun, clip):
        gun.preseClip(clip)

    def getGun(self, gun):
        self._gun = gun

    def __str__(self):
        if self._hp > 0:

            if self._gun:
                return '%s当前血量为：%s,%s' % (self._name, self._hp, self._gun)
            else:
                return '%s当前血量为：%s,没有枪' % (self._name, self._hp)

        else:
            return '%s已死亡' % self._name

    def fire(self, enemy):
        self._gun.hurt(enemy)

    def injured(self, hurt):
        self._hp -= hurt


class Gun(object):
    """创建一个枪类"""

    def __init__(self, name):

        self._name = name  # 枪类绑定名字属性
        self._clip = None

    def preseClip(self, clip):
        self._clip = clip

    def __str__(self):
        if self._clip:
            return '%s%s' % (self._name, self._clip)
        else:
            return '%s没有弹夹' % self._name

    def hurt(self, enemy):
        """枪从弹夹获取一发子弹"""
        if self._clip:
            bullet_temp = self._clip.toBullet()
            bullet_temp.lethalityToBullet(enemy)

        else:
            print('没有弹夹')


class Clip(object):
    """创建一个弹夹类"""

    def __init__(self, capacity):
        self._capacity = capacity  # 弹夹的容量
        self._listBullet = []

    def preseBullet(self, bullet):
        self._listBullet.append(bullet)

    @property
    def listBullet(self):
        return self._listBullet

    def __str__(self):
        return '当前弹夹信息为：%d/%d' % (len(self._listBullet), self._capacity)

    def toBullet(self):
        if self._listBullet:
            return self._listBullet.pop()
        else:
            return None


class Bullet(object):
    """创建一个子弹对象"""

    def __init__(self, lethailty):
        self._lethality = lethailty  # 子弹的杀伤力

    def lethalityToBullet(self, enemy):
        enemy.injured(self._lethality)


def main():
    """流程控制"""

    # 创建一个老王
    laowang = Person('老王')

    # 创建一个枪的对象
    ak98 = Gun('98K')

    # 创建一个弹夹的对象
    clip = Clip(20)

    # 创建一些子弹的对象
    for _ in range(15):
        bullet = Bullet(10)

        # 老王把子弹装进弹夹
        laowang.bulletToClip(bullet, clip)

    # test:测试弹夹信息
    # print(clip)

    # 老王把弹夹装进枪
    laowang.clipToGun(ak98, clip)

    # test:测试枪的信息
    # print(ak98)

    # 老王拿枪
    laowang.getGun(ak98)

    # test:测试老王的信息
    # print(laowang)

    # 创建一个敌人对象
    laosong = Person('老宋')
    # print(laosong)

    # 老王开枪打敌人
    for _ in range(len(clip.listBullet)):
        laowang.fire(laosong)
        print(laowang)
        print(laosong)


if __name__ == '__main__':
    main()