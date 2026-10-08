
import pygame, sys
pygame.init()
screen = pygame.display.set_mode((800,600))

while True:
    screen.fill((0,0,0))

    pygame.display.update()

    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.quit()
            sys.exit()