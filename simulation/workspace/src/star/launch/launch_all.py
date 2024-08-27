# launch_all.py

from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription([
        Node(
            package='slam_gmapping',
            executable='slam_gmapping',
            name='slam_gmapping',
            output='screen'
        ),
        Node(
            package='rviz2',
            executable='rviz2',
            name='rviz2',
            output='screen'
        ),
        Node(
            package='star',
            executable='qr_decoder',
            name='qr_decoder',
            output='screen'
        ),
        Node(
            package='star',
            executable='navigation',
            name='navigation',
            output='screen'
        ),
        
    ])
