GDPC                                                                                  res://Node2D.gd.remap   �	      !       �����lꏑ�ZV�   res://Node2D.gdc�            /���;��8��7���   res://Node2D.tscn   �      }      W�yG��׷DbB�   res://default_env.tres   	      �       um�`�N��<*ỳ�8   res://project.binary 
      :      �b
�̲�o�d��^��            GDSC         /   �      ���ӄ�   ��������������Ŷ   ���������������׶���   �����������ٶ���   �����������Ŷ���   ����ڶ��   ���¶���   ���۶���   ������Ķ   ����׶��   ߶��   ׶��   ���۶���   ������������������������Ҷ��   �������¶���                Sua lista desordenada:              ,         .                
Sua lista ordenada:          .                                                       	   $   
   .      :      =      I      J      K      N      O      P      W      e      f      n      s      t      �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,   �   -   �   .   �   /   3YYY0�  P�  QVY�  ;�  �  T�  PQ�  �  W�  T�  �  �  )�  �  V�  &�  �  L�  MV�  W�  T�  �>  P�  Q�  �  (V�  W�  T�  �>  P�  Q�  �  �  �  .�  YYY0�  P�	  QV�  )�
  �K  P�  R�X  P�	  QQVY�  ;�  �	  L�
  M�  ;�  �
  Y�  *�  �  �  	�	  L�  �  MVY�  �	  L�  M�	  L�  �  M�  �  �  Y�  �	  L�  M�  Y�  W�  T�  �  �  )�  �	  V�  &�  �	  L�  MV�  W�  T�  �>  P�  Q�  �  (V�  W�  T�  �>  P�  Q�  �  �  �  .�	  YYYYY0�  P�  QV�  �  P�  P�  QQY`       [gd_scene load_steps=2 format=2]

[ext_resource path="res://Node2D.gd" type="Script" id=1]

[node name="Node2D" type="Node2D"]
script = ExtResource( 1 )

[node name="LineEdit" type="LineEdit" parent="."]
margin_left = 256.0
margin_top = 256.0
margin_right = 768.0
margin_bottom = 320.0
align = 1
placeholder_text = "Digite dez números separados por espaço e pressione \"Enter\" para ordená-los"

[node name="Label" type="Label" parent="."]
margin_top = 320.0
margin_right = 1024.0
margin_bottom = 424.0
align = 1
valign = 1
autowrap = true

[connection signal="text_entered" from="LineEdit" to="." method="_on_LineEdit_text_entered"]
   [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             [remap]

path="res://Node2D.gdc"
               ECFG      application/config/name         Semana9    application/run/main_scene         res://Node2D.tscn   +   gui/common/drop_mouse_on_gui_input_disabled         )   physics/common/enable_pause_aware_picking         )   rendering/environment/default_environment          res://default_env.tres        