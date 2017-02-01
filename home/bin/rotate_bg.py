#!/usr/bin/python

import os
import sys
import glob
import random
import itertools

BASE_DIR = os.path.expanduser('~/Pictures')

WALLS_DIRS = [
    os.path.join(BASE_DIR, dirname) for dirname in [
        'Wallpapers',
    ]
]

USED_WALLS_FILE = os.path.join(os.path.expanduser('~/.walls'))

EXTENSIONS = (
    'jpg',
    'png',
    'jpe',
    'jpeg',
)


PATTERNS = ['*.%s' % ext for ext in EXTENSIONS]


def change_background(image):
    os.system('gsettings set org.gnome.desktop.background picture-uri '
              '"file://%s"' % image)

    # centered, tiled, scaled, zoom
    # os.system('gsettings set org.gnome.desktop.background '
    #         'picture-options "zoom"')


def get_images():
    return list(
        itertools.chain.from_iterable(
            itertools.chain.from_iterable(
                glob.glob(os.path.join(walls_dir, pattern)
                          ) for pattern in PATTERNS
            ) for walls_dir in WALLS_DIRS
        )
    )


def select_random_image(images):
    try:
        return random.choice(images)
    except IndexError:
        return None


def run():
    used_walls = []
    if os.path.exists(USED_WALLS_FILE):
        used_walls = [w.strip() for w in open(USED_WALLS_FILE).readlines()]

    num_tries = 0
    images = get_images()

    while True:
        image = select_random_image(images)
        if image is None:
            sys.stderr.out('No images found in source dirs')
            sys.exit(1)
        if image not in used_walls:
            break
        num_tries += 1
        if num_tries >= len(used_walls):
            os.remove(USED_WALLS_FILE)
            used_walls = []

    change_background(image)
    with open(USED_WALLS_FILE, 'a') as fp:
        fp.write(image + '\r\n')
    sys.stdout.write('New background image: %s\r\n' % image)


if __name__ == "__main__":
    run()
