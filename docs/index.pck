GDPC                                                                                  res://Teste.gd.remap�              h�t��̮^�p�CL�   res://Teste.gdc p      n      ��5��Rg\�oZ��   res://Teste.tscn�      �      ޠ�����'�m����   res://default_env.tres  �
      �       um�`�N��<*ỳ�8   res://project.binary�      2      8� f����	 m2�Z�    GDSC         5   �      ���ӄ�   ���Ӷ���   �����ٶ�   ����׶��   �����������������Ҷ�   �������¶���   ���¶���   ���������؄�������Ҷ   ߶��   �����Ҷ�   ����ڶ��   ���������؅�������Ҷ   ���¶���   ����ڄ��      Joto          
                     baldo                            	      
                     	      
                            !      "      ,      -      4      5      6      <      =      F      G      H      L      S      T      ^      _      `       f   !   g   "   h   #   m   $   r   %   s   &   ~   '      (   �   )   �   *   �   +   �   ,   �   -   �   .   �   /   �   0   �   1   �   2   �   3   �   4   �   5   3YYY;�  YYYY;�  �  YY;�  LMYY0�  PQV�  �  �  �  �  �  PW�  T�  Q�  �  W�  T�  �  �  �  Y0�  PQV�  �  )�  �K  P�  QV�  �  �  �  �  �  �  T�	  P�  Q�  �  W�
  T�  �>  P�  QYYY0�  PQV�  �  �  ;�  �  �  ;�  �  �  �  *P�X  P�  Q�  QV�  �  �  &P�  L�  M�  �  QV�  �  �  �  �  �  �  �  �  �  �  &P�  �  QV�  �  �  �  W�  T�  �  YYY`  [gd_scene load_steps=2 format=2]

[ext_resource path="res://Teste.gd" type="Script" id=1]

[node name="Teste" type="Node2D"]
script = ExtResource( 1 )

[node name="LineEdit" type="LineEdit" parent="."]
margin_left = 448.0
margin_top = 208.0
margin_right = 576.0
margin_bottom = 256.0
placeholder_text = "Insira um número"

[node name="Button" type="Button" parent="."]
margin_left = 192.0
margin_top = 384.0
margin_right = 256.0
margin_bottom = 424.0
text = "Button"

[node name="Button2" type="Button" parent="."]
margin_left = 480.0
margin_top = 384.0
margin_right = 544.0
margin_bottom = 425.0
text = "Button2"

[node name="Button3" type="Button" parent="."]
margin_left = 768.0
margin_top = 384.0
margin_right = 832.0
margin_bottom = 424.0
text = "Button3"

[node name="Label" type="Label" parent="."]
margin_left = 472.0
margin_top = 448.0
margin_right = 552.0
margin_bottom = 491.0
align = 1

[node name="Label2" type="Label" parent="."]
margin_left = 760.0
margin_top = 448.0
margin_right = 840.0
margin_bottom = 486.0
align = 1

[connection signal="pressed" from="Button" to="." method="_on_Button_pressed"]
[connection signal="pressed" from="Button2" to="." method="_on_Button2_pressed"]
[connection signal="pressed" from="Button3" to="." method="_on_Button3_pressed"]
 [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             [remap]

path="res://Teste.gdc"
ECFG      application/config/name         Aula   application/run/main_scene         res://Teste.tscn+   gui/common/drop_mouse_on_gui_input_disabled         )   physics/common/enable_pause_aware_picking         )   rendering/environment/default_environment          res://default_env.tres                