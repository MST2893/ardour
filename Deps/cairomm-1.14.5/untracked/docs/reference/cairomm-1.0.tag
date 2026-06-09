<?xml version='1.0' encoding='UTF-8' standalone='yes' ?>
<tagfile doxygen_version="1.9.4">
  <compound kind="struct">
    <name>Cairo::ColorStop</name>
    <filename>structCairo_1_1ColorStop.html</filename>
    <member kind="variable">
      <type>double</type>
      <name>offset</name>
      <anchorfile>structCairo_1_1ColorStop.html</anchorfile>
      <anchor>af72e052087d61385d988b7134107a1a4</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>double</type>
      <name>red</name>
      <anchorfile>structCairo_1_1ColorStop.html</anchorfile>
      <anchor>adbdcec948c42c467bdbfb9aa61427356</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>double</type>
      <name>green</name>
      <anchorfile>structCairo_1_1ColorStop.html</anchorfile>
      <anchor>a06929ffc17da4af254cc2f2a4cc09f1c</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>double</type>
      <name>blue</name>
      <anchorfile>structCairo_1_1ColorStop.html</anchorfile>
      <anchor>adcd9c23cf18fc73cf10045a05b8f4e16</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>double</type>
      <name>alpha</name>
      <anchorfile>structCairo_1_1ColorStop.html</anchorfile>
      <anchor>a524397babe94f70ed6205433066e2649</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Cairo::Context</name>
    <filename>classCairo_1_1Context.html</filename>
    <member kind="typedef">
      <type>cairo_t</type>
      <name>cobject</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a14e54b45199452f9916ebcafcd4a629e</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Context</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>adb2361743a9f017e662c3c6809dfc765</anchor>
      <arglist>(cairo_t *cobject, bool has_reference=false)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Context</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>acac6e893153cbe7748227dbfdcb97949</anchor>
      <arglist>(const Context &amp;)=delete</arglist>
    </member>
    <member kind="function">
      <type>Context &amp;</type>
      <name>operator=</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a02db4ac3bff7776c63ea3faed0868fff</anchor>
      <arglist>(const Context &amp;)=delete</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~Context</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a35d214d3ad4d29bd5993d683333a9791</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>save</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a5249fa850f6adc1cb743e60a65a1ddb6</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>restore</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a45a80032b95d87eafe72dc2ab235f815</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_operator</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a61f276527b921cbd4fd81880ac372e2a</anchor>
      <arglist>(Operator op)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_source</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a534d571d5aa4b500782036202a3e2aea</anchor>
      <arglist>(const RefPtr&lt; const Pattern &gt; &amp;source)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_source_rgb</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>aff3f3fc62bdf862646bb8cc568c30b2a</anchor>
      <arglist>(double red, double green, double blue)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_source_rgba</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>af9267aed8eb866701178dcada6c7e51a</anchor>
      <arglist>(double red, double green, double blue, double alpha)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_source</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>ad88c0ef8700410920b37833b8e6ed329</anchor>
      <arglist>(const RefPtr&lt; Surface &gt; &amp;surface, double x, double y)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_tolerance</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a01481a915f4086051f1c200f0f7a33d1</anchor>
      <arglist>(double tolerance)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_antialias</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a79220a6785490688fdea41750d8933d6</anchor>
      <arglist>(Antialias antialias)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_fill_rule</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>ad15693ae817e3229409d831c7dd96bed</anchor>
      <arglist>(FillRule fill_rule)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_line_width</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a9ad2649d95e81a65aa0c581c4345375e</anchor>
      <arglist>(double width)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_line_cap</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a07fd8fc2c75558484e960c5ff63a61cc</anchor>
      <arglist>(LineCap line_cap)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_line_join</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a23b5ba9363f568cacc1abf5e79a0200d</anchor>
      <arglist>(LineJoin line_join)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_dash</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>aaa0b483d3f36facb1c9f2aa7f0a0ac13</anchor>
      <arglist>(std::valarray&lt; double &gt; &amp;dashes, double offset)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_dash</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>ade74abb6db86a97ff3800e431e27ba45</anchor>
      <arglist>(std::vector&lt; double &gt; &amp;dashes, double offset)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_dash</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a73d1ece668f1534ed91ae97cbd6abffe</anchor>
      <arglist>(const std::valarray&lt; double &gt; &amp;dashes, double offset)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_dash</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>ad5de6d8a98135971116c63c28fd736b7</anchor>
      <arglist>(const std::vector&lt; double &gt; &amp;dashes, double offset)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>unset_dash</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>ab20ad42403add42a9388b281074b77d2</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_miter_limit</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a583445ca963769d3f31613bc55b1e8ad</anchor>
      <arglist>(double limit)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>translate</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a3058f50f915d9c43d165dfcd1a940cdc</anchor>
      <arglist>(double tx, double ty)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>scale</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a45543fb03fb740fe4c013492f348e084</anchor>
      <arglist>(double sx, double sy)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>rotate</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a332811cd74028c20b5832501ec46d67e</anchor>
      <arglist>(double angle_radians)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>rotate_degrees</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a0ae251ef83d7c2985f4306abc905934d</anchor>
      <arglist>(double angle_degres)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>transform</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>ac520512061fa271fff3b1f922f94c9cb</anchor>
      <arglist>(const Matrix &amp;matrix)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>transform</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a1bb46fed0df67873bef36e8d7c515c5a</anchor>
      <arglist>(const cairo_matrix_t &amp;matrix)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_matrix</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>ac2eafbac5591e569d22495f7920d60d2</anchor>
      <arglist>(const Matrix &amp;matrix)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_matrix</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a6d94c400c393d7e40bf2d2bbf4e6dcba</anchor>
      <arglist>(const cairo_matrix_t &amp;matrix)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_identity_matrix</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>aa3e9b13312b6ef331830b5348093e19e</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>user_to_device</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>aa9cc3eeb14b515b184be6a401c0993a4</anchor>
      <arglist>(double &amp;x, double &amp;y)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>user_to_device_distance</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>ab0daccfeaa8b173b26473e79271f7e88</anchor>
      <arglist>(double &amp;dx, double &amp;dy)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>device_to_user</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a0c7acaaf16d4740cd7fee2298bf2b5c4</anchor>
      <arglist>(double &amp;x, double &amp;y)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>device_to_user_distance</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a2f396567b0504d1421abb5f7ed38cd97</anchor>
      <arglist>(double &amp;dx, double &amp;dy)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>user_to_device</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a199306ce31ff570c1f29a638a43d8690</anchor>
      <arglist>(double &amp;x, double &amp;y) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>user_to_device_distance</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a524ff7dff666018dfc85180e27d91349</anchor>
      <arglist>(double &amp;dx, double &amp;dy) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>device_to_user</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>ab87d94e62fcf0c0785182e47c154b185</anchor>
      <arglist>(double &amp;x, double &amp;y) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>device_to_user_distance</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a80ab5b3e13c71378974da66fc1239a63</anchor>
      <arglist>(double &amp;dx, double &amp;dy) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>begin_new_path</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a527efe9a3a5bf48f768e223d5f4fecca</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>begin_new_sub_path</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a8cb4b961893563c585ed05a67126b0df</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>move_to</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a4086700b5f780fd3fb94bea941895022</anchor>
      <arglist>(double x, double y)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>line_to</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>ae305a9f8a79cc0e0693393a940ee1de8</anchor>
      <arglist>(double x, double y)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>curve_to</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a9bdb6a5e2ea0e4bc9441bdc5704805f7</anchor>
      <arglist>(double x1, double y1, double x2, double y2, double x3, double y3)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>arc</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>aaa96080beea581244f0a3838fb7c9ee6</anchor>
      <arglist>(double xc, double yc, double radius, double angle1, double angle2)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>arc_negative</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a1a9e7517cd5afd49d729b8a87539a305</anchor>
      <arglist>(double xc, double yc, double radius, double angle1, double angle2)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>rel_move_to</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a3c739ac7e8e43d395f24dff0a0a83c0d</anchor>
      <arglist>(double dx, double dy)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>rel_line_to</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a35f2d0f7e9afcb59eef83af3d2831f2b</anchor>
      <arglist>(double dx, double dy)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>rel_curve_to</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>ad7660dac997d5db2f7ce1539c20345e2</anchor>
      <arglist>(double dx1, double dy1, double dx2, double dy2, double dx3, double dy3)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>rectangle</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a85ee124b89c43dc29ff0d964bd005c11</anchor>
      <arglist>(double x, double y, double width, double height)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>close_path</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a32211b0684b1d264c17402b5289fcba0</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>paint</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>ad919eae3bc3b9827a3c1ceff2d86833e</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>paint_with_alpha</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a34208a6c6868cdcd65866cb8a2349525</anchor>
      <arglist>(double alpha)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>mask</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a2ad3ea59afb6bb4fa04d000f5e9c3cf2</anchor>
      <arglist>(const RefPtr&lt; const Pattern &gt; &amp;pattern)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>mask</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a2f76e3b13027efc4c8745de5e04e00ec</anchor>
      <arglist>(const RefPtr&lt; const Surface &gt; &amp;surface, double surface_x, double surface_y)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>stroke</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a8e4acbb44f4b3fac00ee93f6251d6d17</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>stroke_preserve</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>ab10d89295e122b04ff1bbda425ae069c</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>fill</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a0a484790884dd138108b07c0ebbbe21d</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>fill_preserve</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a0ef3f887f91527a485ce1300972ac8e3</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>copy_page</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a7ccbeacb2a7f2d787b3daf31a69383fd</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>show_page</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a525cac95b4d4c2abea12b82c433adba9</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>in_stroke</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a6276bc63300697b51ff755b947aef682</anchor>
      <arglist>(double x, double y) const</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>in_fill</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a19a91731bcd56ce82a16d34e755f2e6f</anchor>
      <arglist>(double x, double y) const</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>in_clip</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a330ca5dc08b737eace4b6668bf3eae4e</anchor>
      <arglist>(double x, double y) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>get_stroke_extents</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a7f405718933502cf124868bac5cde071</anchor>
      <arglist>(double &amp;x1, double &amp;y1, double &amp;x2, double &amp;y2) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>get_fill_extents</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a67bfb97d01b431c64347c7231aa8ad56</anchor>
      <arglist>(double &amp;x1, double &amp;y1, double &amp;x2, double &amp;y2) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>reset_clip</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a82d001967dc8ba3e45f4d7a06c4b9ff2</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>clip</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a423077b911738772807cc8bc24c25488</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>clip_preserve</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a2987c4ecac0438ee808c34d3c35c7f2e</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>get_clip_extents</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>ae96bd9b4308dbff6736beba435a079ab</anchor>
      <arglist>(double &amp;x1, double &amp;y1, double &amp;x2, double &amp;y2) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>copy_clip_rectangle_list</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>aaa3ae8d14df4613789a57c3e70fcda23</anchor>
      <arglist>(std::vector&lt; Rectangle &gt; &amp;rectangles) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>select_font_face</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>acb1da5f3949195f76424e11be923fbfd</anchor>
      <arglist>(const std::string &amp;family, FontSlant slant, FontWeight weight)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_font_size</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>ac8a04a09c2e871a470fd030edb45b024</anchor>
      <arglist>(double size)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_font_matrix</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a7981bd1109ec5538fb505b36ec377757</anchor>
      <arglist>(const Matrix &amp;matrix)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>get_font_matrix</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a0281048067a319233fc48cc80ad77d12</anchor>
      <arglist>(Matrix &amp;matrix) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_font_options</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a2d7f465d946804a8fe9877d7f7f4bbcb</anchor>
      <arglist>(const FontOptions &amp;options)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_font_matrix</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a8d44b4f4e45a4fb2a794f3486f895640</anchor>
      <arglist>(const cairo_matrix_t &amp;matrix)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>get_font_matrix</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a4646d153c0f101f23775a302eda3c7a4</anchor>
      <arglist>(cairo_matrix_t &amp;matrix) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>get_font_options</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>aece9db7a58577f5ab783e53fccc639b6</anchor>
      <arglist>(FontOptions &amp;options) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_scaled_font</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>aaa8c0b24d9338d392c18435babeb4263</anchor>
      <arglist>(const RefPtr&lt; const ScaledFont &gt; &amp;scaled_font)</arglist>
    </member>
    <member kind="function">
      <type>RefPtr&lt; ScaledFont &gt;</type>
      <name>get_scaled_font</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>af44540ed323414d2e00c21ca50f9954c</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>show_text</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a584596d6f12dbea30519b908cacce038</anchor>
      <arglist>(const std::string &amp;utf8)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>show_glyphs</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>af51f2c2ff72e8af66abeea3d15d25553</anchor>
      <arglist>(const std::vector&lt; Glyph &gt; &amp;glyphs)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>show_text_glyphs</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a45723fd605cc2343ab46cf603d330002</anchor>
      <arglist>(const std::string &amp;utf8, const std::vector&lt; Glyph &gt; &amp;glyphs, const std::vector&lt; TextCluster &gt; &amp;clusters, TextClusterFlags cluster_flags)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>get_font_extents</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a8ece132ece9ec63f86e5bbf45ed686b2</anchor>
      <arglist>(FontExtents &amp;extents) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_font_face</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a9b344db51097aba30e36452e1364faef</anchor>
      <arglist>(const RefPtr&lt; const FontFace &gt; &amp;font_face)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>get_text_extents</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a909ca8c9aaf9018745112af2d46c79bc</anchor>
      <arglist>(const std::string &amp;utf8, TextExtents &amp;extents) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>get_glyph_extents</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>aa1c00cf35fb0e30df20772e4b4098a87</anchor>
      <arglist>(const std::vector&lt; Glyph &gt; &amp;glyphs, TextExtents &amp;extents) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>text_path</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a5613b4202f82f6a53f1aeac6c58e5521</anchor>
      <arglist>(const std::string &amp;utf8)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>glyph_path</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>ad3372fc30d9a26c8d26c440a21464ce5</anchor>
      <arglist>(const std::vector&lt; Glyph &gt; &amp;glyphs)</arglist>
    </member>
    <member kind="function">
      <type>Operator</type>
      <name>get_operator</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a50cb92a3ca38b5ee4eb0e8df41cddcc8</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>get_tolerance</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>ac8d5a64ea618216d04de506d0472c408</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>Antialias</type>
      <name>get_antialias</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a1a19881af182e4cf2b1507f745a64ba2</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>get_current_point</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a3c1c8740cc30c66a949d96a21d020b69</anchor>
      <arglist>(double &amp;x, double &amp;y) const</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>has_current_point</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a4adde35335f48ddea4f05d171ccf8f09</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>FillRule</type>
      <name>get_fill_rule</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>ac93f9c482ed4eb4f7959d9ad0a53d8b5</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>get_line_width</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a74355c4d0e1ffd705468f7051f00ca31</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>LineCap</type>
      <name>get_line_cap</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a14c7f50543c11f5c64b87a270411b530</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>LineJoin</type>
      <name>get_line_join</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a09677be4f41c4915934bcc597269072d</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>get_miter_limit</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a3d90dc5cbac6c6ba5375c4099c4adb97</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>get_dash</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a5a149990c950132f76427af71fad58f8</anchor>
      <arglist>(std::vector&lt; double &gt; &amp;dashes, double &amp;offset) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>get_matrix</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a03b21f4a3a44e28086c3a25075fdcea1</anchor>
      <arglist>(Matrix &amp;matrix)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>get_matrix</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>aea651404be2fa942033c636e2665cd7e</anchor>
      <arglist>(cairo_matrix_t &amp;matrix)</arglist>
    </member>
    <member kind="function">
      <type>Matrix</type>
      <name>get_matrix</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a09bfc57f11ca13ab4debfb646ea02db0</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>Path *</type>
      <name>copy_path</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>aa2cd077a87d57af05b79123bf373261b</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>get_path_extents</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>aeca9fad292013dcc053e61b5dd2576bf</anchor>
      <arglist>(double &amp;x1, double &amp;y1, double &amp;x2, double &amp;y2) const</arglist>
    </member>
    <member kind="function">
      <type>Path *</type>
      <name>copy_path_flat</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a388eab5bf775b3cac980a1329d7208c5</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>append_path</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>aee34ef17540ad11f33176e8897d73203</anchor>
      <arglist>(const Path &amp;path)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>push_group</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>aa0a5a1ee48ff742d87480a689dca51c6</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>push_group_with_content</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>ad08812ecb59891f92e79a3d4dbca2d97</anchor>
      <arglist>(Content content)</arglist>
    </member>
    <member kind="function">
      <type>RefPtr&lt; Pattern &gt;</type>
      <name>pop_group</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>ab61303ba1742cf74cfded185b4def62e</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>pop_group_to_source</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>abd11fa1d3a582e0975ebb0155b9d4467</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>RefPtr&lt; Surface &gt;</type>
      <name>get_group_target</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a99b9a60e1ae856ec16a50bfb8ab2bd2f</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>RefPtr&lt; const Surface &gt;</type>
      <name>get_group_target</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a5802d213be84ed58be425309582e661d</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>cobject *</type>
      <name>cobj</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>aa5abf3945d8826ffe994f56d540718cb</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const cobject *</type>
      <name>cobj</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>ac0953e0c1d07a8d07f8e9962cc2d382f</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>RefPtr&lt; FontFace &gt;</type>
      <name>get_font_face</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a63aab4600a800e369f5769bb75487be8</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>RefPtr&lt; const FontFace &gt;</type>
      <name>get_font_face</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>aee14bdc61463711a194deed4821eebcc</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>RefPtr&lt; Pattern &gt;</type>
      <name>get_source</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a1757fe3241cc519d965701e61bcad023</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>RefPtr&lt; const Pattern &gt;</type>
      <name>get_source</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a443e069bf773b1932baa302910df37e9</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>RefPtr&lt; SurfacePattern &gt;</type>
      <name>get_source_for_surface</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>aec8e0ea1557bc6b1550d442567e0a356</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>RefPtr&lt; const SurfacePattern &gt;</type>
      <name>get_source_for_surface</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>ae85f699cf65b115977d2bb84ff80b310</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>RefPtr&lt; Surface &gt;</type>
      <name>get_target</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a71f991fc2a1e72aa7018ec4b3d6547d3</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>RefPtr&lt; const Surface &gt;</type>
      <name>get_target</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a864753d10c3502f49924228b7d2a7a60</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; Context &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a5c1dc764b9a6b484365ae9dc9c11d096</anchor>
      <arglist>(const RefPtr&lt; Surface &gt; &amp;target)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type></type>
      <name>Context</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>ac3c5491dbf6e57a26369e987361f6cd8</anchor>
      <arglist>(const RefPtr&lt; Surface &gt; &amp;target)</arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>cobject *</type>
      <name>m_cobject</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a620db06ff96d42e8e1db12ada0435fcc</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>RefPtr&lt; FontFace &gt;</type>
      <name>get_font_face</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a63aab4600a800e369f5769bb75487be8</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>RefPtr&lt; const FontFace &gt;</type>
      <name>get_font_face</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>aee14bdc61463711a194deed4821eebcc</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>RefPtr&lt; Pattern &gt;</type>
      <name>get_source</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a1757fe3241cc519d965701e61bcad023</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>RefPtr&lt; const Pattern &gt;</type>
      <name>get_source</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a443e069bf773b1932baa302910df37e9</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>RefPtr&lt; SurfacePattern &gt;</type>
      <name>get_source_for_surface</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>aec8e0ea1557bc6b1550d442567e0a356</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>RefPtr&lt; const SurfacePattern &gt;</type>
      <name>get_source_for_surface</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>ae85f699cf65b115977d2bb84ff80b310</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>RefPtr&lt; Surface &gt;</type>
      <name>get_target</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a71f991fc2a1e72aa7018ec4b3d6547d3</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>RefPtr&lt; const Surface &gt;</type>
      <name>get_target</name>
      <anchorfile>classCairo_1_1Context.html</anchorfile>
      <anchor>a864753d10c3502f49924228b7d2a7a60</anchor>
      <arglist>() const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Cairo::Device</name>
    <filename>classCairo_1_1Device.html</filename>
    <class kind="class">Cairo::Device::Lock</class>
    <member kind="typedef">
      <type>cairo_device_t</type>
      <name>cobject</name>
      <anchorfile>classCairo_1_1Device.html</anchorfile>
      <anchor>a327c8a8ac39f484f68a550ae34f82411</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Device</name>
      <anchorfile>classCairo_1_1Device.html</anchorfile>
      <anchor>aec567647cc3675369f49fdcc469c6132</anchor>
      <arglist>(cairo_device_t *cobject, bool has_reference=false)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~Device</name>
      <anchorfile>classCairo_1_1Device.html</anchorfile>
      <anchor>a94fd2ef7446a1653e7e7a8e2642ec826</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>DeviceType</type>
      <name>get_type</name>
      <anchorfile>classCairo_1_1Device.html</anchorfile>
      <anchor>aa732d43ff7626030ee426b9be3ebfa88</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>flush</name>
      <anchorfile>classCairo_1_1Device.html</anchorfile>
      <anchor>a8c41a4a0a95d25fa60012036d165abd9</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>finish</name>
      <anchorfile>classCairo_1_1Device.html</anchorfile>
      <anchor>afe9262cdb04d7ec3f58d48333d1898f5</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>acquire</name>
      <anchorfile>classCairo_1_1Device.html</anchorfile>
      <anchor>aedd60074545b2d744fda80fde40bfb79</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>release</name>
      <anchorfile>classCairo_1_1Device.html</anchorfile>
      <anchor>a044504de9e04b01d52a65521f48c0556</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>cobject *</type>
      <name>cobj</name>
      <anchorfile>classCairo_1_1Device.html</anchorfile>
      <anchor>a689469411f7ec4f5529dd82904b4cb14</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const cobject *</type>
      <name>cobj</name>
      <anchorfile>classCairo_1_1Device.html</anchorfile>
      <anchor>a9d893b62b1e50499f9b85c48daed8e4f</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>reference</name>
      <anchorfile>classCairo_1_1Device.html</anchorfile>
      <anchor>a582985b56b0b34591d6b73864050151e</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>unreference</name>
      <anchorfile>classCairo_1_1Device.html</anchorfile>
      <anchor>a00c9464bd0a1e8f3863ca29e63d1727b</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>cobject *</type>
      <name>m_cobject</name>
      <anchorfile>classCairo_1_1Device.html</anchorfile>
      <anchor>a2252dec9ccb0905a5b74491d4b09315d</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Cairo::Device::Lock</name>
    <filename>classCairo_1_1Device_1_1Lock.html</filename>
    <member kind="function">
      <type></type>
      <name>Lock</name>
      <anchorfile>classCairo_1_1Device_1_1Lock.html</anchorfile>
      <anchor>a7a376f275131519394fb4256418ee607</anchor>
      <arglist>(const RefPtr&lt; Device &gt; &amp;device)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Lock</name>
      <anchorfile>classCairo_1_1Device_1_1Lock.html</anchorfile>
      <anchor>ac717b4a10ad681aae711c852e0824571</anchor>
      <arglist>(const Lock &amp;other)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~Lock</name>
      <anchorfile>classCairo_1_1Device_1_1Lock.html</anchorfile>
      <anchor>a0a5e7c6b770589a05554ebae5681ed10</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Cairo::FontFace</name>
    <filename>classCairo_1_1FontFace.html</filename>
    <member kind="typedef">
      <type>cairo_font_face_t</type>
      <name>cobject</name>
      <anchorfile>classCairo_1_1FontFace.html</anchorfile>
      <anchor>ab1631f7eb6458a98be291880a1dde3d7</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>FontFace</name>
      <anchorfile>classCairo_1_1FontFace.html</anchorfile>
      <anchor>af464d8f051930da555fcbf632add755d</anchor>
      <arglist>(cairo_font_face_t *cobject, bool has_reference=false)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>FontFace</name>
      <anchorfile>classCairo_1_1FontFace.html</anchorfile>
      <anchor>ae2d3222529600fbb66ce780f9a300ce1</anchor>
      <arglist>(const FontFace &amp;)=delete</arglist>
    </member>
    <member kind="function">
      <type>FontFace &amp;</type>
      <name>operator=</name>
      <anchorfile>classCairo_1_1FontFace.html</anchorfile>
      <anchor>a3ca6f331985cfcc250eef1eae11cb47d</anchor>
      <arglist>(const FontFace &amp;)=delete</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~FontFace</name>
      <anchorfile>classCairo_1_1FontFace.html</anchorfile>
      <anchor>aa5d84dba43cd09c1710b458132a9ab8d</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>FontType</type>
      <name>get_type</name>
      <anchorfile>classCairo_1_1FontFace.html</anchorfile>
      <anchor>a98bff385bb1db4993ebd24a441bc16e3</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>cobject *</type>
      <name>cobj</name>
      <anchorfile>classCairo_1_1FontFace.html</anchorfile>
      <anchor>a05794d2c530d9927843ac9c98c86111d</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const cobject *</type>
      <name>cobj</name>
      <anchorfile>classCairo_1_1FontFace.html</anchorfile>
      <anchor>a11f240d5ba67c53cc7c4150e09a5e0e6</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>reference</name>
      <anchorfile>classCairo_1_1FontFace.html</anchorfile>
      <anchor>a4fe6cc99dc2d558667a4e6b2d2e4acef</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>unreference</name>
      <anchorfile>classCairo_1_1FontFace.html</anchorfile>
      <anchor>a2af457172ecb7b14ef55a74ed10094ec</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>cobject *</type>
      <name>m_cobject</name>
      <anchorfile>classCairo_1_1FontFace.html</anchorfile>
      <anchor>ae2d03f09adca1b8f9008680f0e831b0c</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Cairo::FontOptions</name>
    <filename>classCairo_1_1FontOptions.html</filename>
    <member kind="typedef">
      <type>cairo_font_options_t</type>
      <name>cobject</name>
      <anchorfile>classCairo_1_1FontOptions.html</anchorfile>
      <anchor>a458ecd8eb6ab6cbe9d0f70720504dc19</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>FontOptions</name>
      <anchorfile>classCairo_1_1FontOptions.html</anchorfile>
      <anchor>a2b818a9af6d23ad39fb4e2ce74d24df6</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>FontOptions</name>
      <anchorfile>classCairo_1_1FontOptions.html</anchorfile>
      <anchor>a475377dfa1550fbaed93e3b3a79d96e8</anchor>
      <arglist>(cairo_font_options_t *cobject, bool take_ownership=false)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>FontOptions</name>
      <anchorfile>classCairo_1_1FontOptions.html</anchorfile>
      <anchor>a3b10ebfd94fc8f8c047a85d4400ced7b</anchor>
      <arglist>(const FontOptions &amp;src)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~FontOptions</name>
      <anchorfile>classCairo_1_1FontOptions.html</anchorfile>
      <anchor>a27f29f5bb5191d6202eeeaa6c5485cbb</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>FontOptions &amp;</type>
      <name>operator=</name>
      <anchorfile>classCairo_1_1FontOptions.html</anchorfile>
      <anchor>acb28db2dd5fe35d2a5b97d86e9d41d16</anchor>
      <arglist>(const FontOptions &amp;src)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>operator==</name>
      <anchorfile>classCairo_1_1FontOptions.html</anchorfile>
      <anchor>ae29f0fe90729bcfae3a127d8b82c6a7b</anchor>
      <arglist>(const FontOptions &amp;src) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>merge</name>
      <anchorfile>classCairo_1_1FontOptions.html</anchorfile>
      <anchor>ae64b209cc8200f786d07185fc93552ed</anchor>
      <arglist>(const FontOptions &amp;other)</arglist>
    </member>
    <member kind="function">
      <type>unsigned long</type>
      <name>hash</name>
      <anchorfile>classCairo_1_1FontOptions.html</anchorfile>
      <anchor>ad31854024937bb451777a9299b73caf4</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_antialias</name>
      <anchorfile>classCairo_1_1FontOptions.html</anchorfile>
      <anchor>ac4805f8378e318a2ad52803285b7e7de</anchor>
      <arglist>(Antialias antialias)</arglist>
    </member>
    <member kind="function">
      <type>Antialias</type>
      <name>get_antialias</name>
      <anchorfile>classCairo_1_1FontOptions.html</anchorfile>
      <anchor>aaf66980918f37f94adcdfd05c1d9afc7</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_subpixel_order</name>
      <anchorfile>classCairo_1_1FontOptions.html</anchorfile>
      <anchor>ae0d566a662586651501920525bfb7dcd</anchor>
      <arglist>(SubpixelOrder subpixel_order)</arglist>
    </member>
    <member kind="function">
      <type>SubpixelOrder</type>
      <name>get_subpixel_order</name>
      <anchorfile>classCairo_1_1FontOptions.html</anchorfile>
      <anchor>a0defa57984600a497b9abeb9099b1577</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_hint_style</name>
      <anchorfile>classCairo_1_1FontOptions.html</anchorfile>
      <anchor>a58b4368e78a15f4c63766b5a47fd951b</anchor>
      <arglist>(HintStyle hint_style)</arglist>
    </member>
    <member kind="function">
      <type>HintStyle</type>
      <name>get_hint_style</name>
      <anchorfile>classCairo_1_1FontOptions.html</anchorfile>
      <anchor>a1b72c5b8c6e4ca744b8d2d680223a963</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_hint_metrics</name>
      <anchorfile>classCairo_1_1FontOptions.html</anchorfile>
      <anchor>ac8ab52d886380075adc27d86ade70c01</anchor>
      <arglist>(HintMetrics hint_metrics)</arglist>
    </member>
    <member kind="function">
      <type>HintMetrics</type>
      <name>get_hint_metrics</name>
      <anchorfile>classCairo_1_1FontOptions.html</anchorfile>
      <anchor>ac6ddc4660347edf5c904bd1ac27190f4</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>cobject *</type>
      <name>cobj</name>
      <anchorfile>classCairo_1_1FontOptions.html</anchorfile>
      <anchor>addb75e729dc33a0061e3eeb6678d0bcb</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const cobject *</type>
      <name>cobj</name>
      <anchorfile>classCairo_1_1FontOptions.html</anchorfile>
      <anchor>a4eb161551b2ff96fac7d8a4c76dd2202</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>cobject *</type>
      <name>m_cobject</name>
      <anchorfile>classCairo_1_1FontOptions.html</anchorfile>
      <anchor>ae64f21fb1def665db48a8d3adfe5db56</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Cairo::FtFontFace</name>
    <filename>classCairo_1_1FtFontFace.html</filename>
    <base>Cairo::FontFace</base>
    <member kind="function">
      <type>void</type>
      <name>set_synthesize</name>
      <anchorfile>classCairo_1_1FtFontFace.html</anchorfile>
      <anchor>a761caaea22c8311e8c2421448dc9b2bf</anchor>
      <arglist>(FtSynthesize synth_flags)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>unset_synthesize</name>
      <anchorfile>classCairo_1_1FtFontFace.html</anchorfile>
      <anchor>a0f13cd834393a815e7074b22457344b4</anchor>
      <arglist>(FtSynthesize synth_flags)</arglist>
    </member>
    <member kind="function">
      <type>FtSynthesize</type>
      <name>get_synthesize</name>
      <anchorfile>classCairo_1_1FtFontFace.html</anchorfile>
      <anchor>a1bab2299939556c946985b05c9818db6</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; FtFontFace &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1FtFontFace.html</anchorfile>
      <anchor>a8980ec46f75512d346e023a07b0a4a23</anchor>
      <arglist>(FT_Face face, int load_flags)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type></type>
      <name>FtFontFace</name>
      <anchorfile>classCairo_1_1FtFontFace.html</anchorfile>
      <anchor>a82d1ff7fb040ba4209511c4e4fbc57f5</anchor>
      <arglist>(FT_Face face, int load_flags)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Cairo::FtScaledFont</name>
    <filename>classCairo_1_1FtScaledFont.html</filename>
    <base>Cairo::ScaledFont</base>
    <member kind="function">
      <type>FT_Face</type>
      <name>lock_face</name>
      <anchorfile>classCairo_1_1FtScaledFont.html</anchorfile>
      <anchor>a8b1153077c36a983a8f9176e554ce980</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>unlock_face</name>
      <anchorfile>classCairo_1_1FtScaledFont.html</anchorfile>
      <anchor>a3b56b2e107f3119bca0a934926dce66e</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; FtScaledFont &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1FtScaledFont.html</anchorfile>
      <anchor>acebeb78cdc26644b7c82901933a52d80</anchor>
      <arglist>(const RefPtr&lt; FtFontFace &gt; &amp;font_face, const Matrix &amp;font_matrix, const Matrix &amp;ctm, const FontOptions &amp;options=FontOptions())</arglist>
    </member>
    <member kind="function" protection="protected">
      <type></type>
      <name>FtScaledFont</name>
      <anchorfile>classCairo_1_1FtScaledFont.html</anchorfile>
      <anchor>a809853982f391540df5ac1c124477d65</anchor>
      <arglist>(const RefPtr&lt; FtFontFace &gt; &amp;font_face, const Matrix &amp;font_matrix, const Matrix &amp;ctm, const FontOptions &amp;options=FontOptions())</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Cairo::GlitzSurface</name>
    <filename>classCairo_1_1GlitzSurface.html</filename>
    <base>Cairo::Surface</base>
    <member kind="function">
      <type></type>
      <name>GlitzSurface</name>
      <anchorfile>classCairo_1_1GlitzSurface.html</anchorfile>
      <anchor>a5cac88d99e13f65090f25ed28983b8ad</anchor>
      <arglist>(cairo_surface_t *cobject, bool has_reference=false)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~GlitzSurface</name>
      <anchorfile>classCairo_1_1GlitzSurface.html</anchorfile>
      <anchor>aa11f3b09aae9de7185d3cdf3e168612a</anchor>
      <arglist>() override</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; GlitzSurface &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1GlitzSurface.html</anchorfile>
      <anchor>a06d9cb054ca07ffc0b56c4e3d876c820</anchor>
      <arglist>(glitz_surface_t *surface)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Cairo::Gradient</name>
    <filename>classCairo_1_1Gradient.html</filename>
    <base>Cairo::Pattern</base>
    <member kind="function">
      <type></type>
      <name>Gradient</name>
      <anchorfile>classCairo_1_1Gradient.html</anchorfile>
      <anchor>a85f7dabff18993648a3e920eb7a8eb04</anchor>
      <arglist>(cairo_pattern_t *cobject, bool has_reference=false)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~Gradient</name>
      <anchorfile>classCairo_1_1Gradient.html</anchorfile>
      <anchor>a76840c2b1b4bbcb9db2e505713087c20</anchor>
      <arglist>() override</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>add_color_stop_rgb</name>
      <anchorfile>classCairo_1_1Gradient.html</anchorfile>
      <anchor>afe5e5167dd48fc684c7e88ea07340a6c</anchor>
      <arglist>(double offset, double red, double green, double blue)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>add_color_stop_rgba</name>
      <anchorfile>classCairo_1_1Gradient.html</anchorfile>
      <anchor>a688da07943fa37f8ccbe33c379544d9f</anchor>
      <arglist>(double offset, double red, double green, double blue, double alpha)</arglist>
    </member>
    <member kind="function">
      <type>std::vector&lt; ColorStop &gt;</type>
      <name>get_color_stops</name>
      <anchorfile>classCairo_1_1Gradient.html</anchorfile>
      <anchor>ace5c275f4a4987b6013b4c5aeca610bc</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function" protection="protected">
      <type></type>
      <name>Gradient</name>
      <anchorfile>classCairo_1_1Gradient.html</anchorfile>
      <anchor>ae50ccbfd16c1a03cd26b574ac4cd7533</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Cairo::ImageSurface</name>
    <filename>classCairo_1_1ImageSurface.html</filename>
    <base>Cairo::Surface</base>
    <member kind="function">
      <type></type>
      <name>ImageSurface</name>
      <anchorfile>classCairo_1_1ImageSurface.html</anchorfile>
      <anchor>a19a7d3c6f4320c4d812629b3c18925ac</anchor>
      <arglist>(cairo_surface_t *cobject, bool has_reference=false)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~ImageSurface</name>
      <anchorfile>classCairo_1_1ImageSurface.html</anchorfile>
      <anchor>a3ca42b6c6d172c1923cbdcd9d0077565</anchor>
      <arglist>() override</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>get_width</name>
      <anchorfile>classCairo_1_1ImageSurface.html</anchorfile>
      <anchor>aac30a950eafc80b67278809adfe48d94</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>get_height</name>
      <anchorfile>classCairo_1_1ImageSurface.html</anchorfile>
      <anchor>a6a49d95aab028ef74bea1cadeed81a26</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>Format</type>
      <name>get_format</name>
      <anchorfile>classCairo_1_1ImageSurface.html</anchorfile>
      <anchor>a4e2ea1788eff7e0df8d99d98a9c1e167</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>get_stride</name>
      <anchorfile>classCairo_1_1ImageSurface.html</anchorfile>
      <anchor>ae9147ecff5115b7c7072de2545b09c8b</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>unsigned char *</type>
      <name>get_data</name>
      <anchorfile>classCairo_1_1ImageSurface.html</anchorfile>
      <anchor>a1e77bc2c6a2d7ddc90774c5a1f933ce4</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const unsigned char *</type>
      <name>get_data</name>
      <anchorfile>classCairo_1_1ImageSurface.html</anchorfile>
      <anchor>a8a6c0e2733d0a56f868ea3ec60db863b</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static int</type>
      <name>format_stride_for_width</name>
      <anchorfile>classCairo_1_1ImageSurface.html</anchorfile>
      <anchor>ac74f130a3bb36bd9fd70003cd8562ce5</anchor>
      <arglist>(Cairo::Format format, int width)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; ImageSurface &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1ImageSurface.html</anchorfile>
      <anchor>a278892299e8668f618f4cec2447ba412</anchor>
      <arglist>(Format format, int width, int height)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; ImageSurface &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1ImageSurface.html</anchorfile>
      <anchor>aa30c994b5b5d8f2f35c41295ce6ccac4</anchor>
      <arglist>(unsigned char *data, Format format, int width, int height, int stride)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; ImageSurface &gt;</type>
      <name>create_from_png</name>
      <anchorfile>classCairo_1_1ImageSurface.html</anchorfile>
      <anchor>abf55691f30625ad5ade82057aad28372</anchor>
      <arglist>(std::string filename)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; ImageSurface &gt;</type>
      <name>create_from_png_stream</name>
      <anchorfile>classCairo_1_1ImageSurface.html</anchorfile>
      <anchor>ab77929105aac2e55804ee61c31711a17</anchor>
      <arglist>(const SlotReadFunc &amp;read_func)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; ImageSurface &gt;</type>
      <name>create_from_png</name>
      <anchorfile>classCairo_1_1ImageSurface.html</anchorfile>
      <anchor>ac2c41194db81bcb285818279e014847c</anchor>
      <arglist>(cairo_read_func_t read_func, void *closure)</arglist>
    </member>
    <member kind="function">
      <type>unsigned char *</type>
      <name>get_data</name>
      <anchorfile>classCairo_1_1ImageSurface.html</anchorfile>
      <anchor>a1e77bc2c6a2d7ddc90774c5a1f933ce4</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const unsigned char *</type>
      <name>get_data</name>
      <anchorfile>classCairo_1_1ImageSurface.html</anchorfile>
      <anchor>a8a6c0e2733d0a56f868ea3ec60db863b</anchor>
      <arglist>() const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Cairo::LinearGradient</name>
    <filename>classCairo_1_1LinearGradient.html</filename>
    <base>Cairo::Gradient</base>
    <member kind="function">
      <type></type>
      <name>LinearGradient</name>
      <anchorfile>classCairo_1_1LinearGradient.html</anchorfile>
      <anchor>a2dea1c14f7c79bac3daa271a3ddbcca6</anchor>
      <arglist>(cairo_pattern_t *cobject, bool has_reference=false)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>get_linear_points</name>
      <anchorfile>classCairo_1_1LinearGradient.html</anchorfile>
      <anchor>a37ef59f60ca7e5d6a48f74441400688a</anchor>
      <arglist>(double &amp;x0, double &amp;y0, double &amp;x1, double &amp;y1) const</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~LinearGradient</name>
      <anchorfile>classCairo_1_1LinearGradient.html</anchorfile>
      <anchor>a56d551c7400f0c2b8f5beda73c86911f</anchor>
      <arglist>() override</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; LinearGradient &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1LinearGradient.html</anchorfile>
      <anchor>a54a8222524922d3a5161cf3fc1678c1d</anchor>
      <arglist>(double x0, double y0, double x1, double y1)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type></type>
      <name>LinearGradient</name>
      <anchorfile>classCairo_1_1LinearGradient.html</anchorfile>
      <anchor>af6b8e8e36eca93bbc6abbd85955299fe</anchor>
      <arglist>(double x0, double y0, double x1, double y1)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Cairo::logic_error</name>
    <filename>classCairo_1_1logic__error.html</filename>
    <base>std::logic_error</base>
    <member kind="function">
      <type></type>
      <name>logic_error</name>
      <anchorfile>classCairo_1_1logic__error.html</anchorfile>
      <anchor>a11d3b1f7a00aa8cdb44107949f305648</anchor>
      <arglist>(ErrorStatus status)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~logic_error</name>
      <anchorfile>classCairo_1_1logic__error.html</anchorfile>
      <anchor>a499156335a7f4eabe592de7f89ed01cf</anchor>
      <arglist>() noexcept override</arglist>
    </member>
    <member kind="function">
      <type>ErrorStatus</type>
      <name>get_status_code</name>
      <anchorfile>classCairo_1_1logic__error.html</anchorfile>
      <anchor>a01c3a19730f333bee84f3e739cd80c30</anchor>
      <arglist>() const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Cairo::Matrix</name>
    <filename>classCairo_1_1Matrix.html</filename>
    <base>cairo_matrix_t</base>
    <member kind="function">
      <type></type>
      <name>Matrix</name>
      <anchorfile>classCairo_1_1Matrix.html</anchorfile>
      <anchor>a69297a4b8adc2bdecece4c372edc1e63</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Matrix</name>
      <anchorfile>classCairo_1_1Matrix.html</anchorfile>
      <anchor>a90a6fe36d7744bfd607c2b37435ca8e6</anchor>
      <arglist>(double xx, double yx, double xy, double yy, double x0, double y0)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>translate</name>
      <anchorfile>classCairo_1_1Matrix.html</anchorfile>
      <anchor>aec65d01b5251144dc20708f0b05940f6</anchor>
      <arglist>(double tx, double ty)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>scale</name>
      <anchorfile>classCairo_1_1Matrix.html</anchorfile>
      <anchor>a697c488fb323f4a6edda4edd0533c95c</anchor>
      <arglist>(double sx, double sy)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>rotate</name>
      <anchorfile>classCairo_1_1Matrix.html</anchorfile>
      <anchor>a98b3feae5ff15937c764ebec846efb33</anchor>
      <arglist>(double radians)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>invert</name>
      <anchorfile>classCairo_1_1Matrix.html</anchorfile>
      <anchor>a3ad532fa3b90ac4019d6a535ffde0cd4</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>multiply</name>
      <anchorfile>classCairo_1_1Matrix.html</anchorfile>
      <anchor>a748df1dafe6a35422fa51b31f6932587</anchor>
      <arglist>(Matrix &amp;a, Matrix &amp;b)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>transform_distance</name>
      <anchorfile>classCairo_1_1Matrix.html</anchorfile>
      <anchor>ae3a344de5dc0192fcecd174aa3fca267</anchor>
      <arglist>(double &amp;dx, double &amp;dy) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>transform_point</name>
      <anchorfile>classCairo_1_1Matrix.html</anchorfile>
      <anchor>ad4a0690274157be0c9c3854ed729cc7f</anchor>
      <arglist>(double &amp;x, double &amp;y) const</arglist>
    </member>
    <member kind="function">
      <type>Matrix</type>
      <name>identity_matrix</name>
      <anchorfile>classCairo_1_1Matrix.html</anchorfile>
      <anchor>a293cbaf13eb86244648cb558b2cf7dd3</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>Matrix</type>
      <name>translation_matrix</name>
      <anchorfile>classCairo_1_1Matrix.html</anchorfile>
      <anchor>ae638d4c68c7f26f9760335eb42680cea</anchor>
      <arglist>(double tx, double ty)</arglist>
    </member>
    <member kind="function">
      <type>Matrix</type>
      <name>scaling_matrix</name>
      <anchorfile>classCairo_1_1Matrix.html</anchorfile>
      <anchor>ac217befdf043bdb5f1c29632e60cbdef</anchor>
      <arglist>(double sx, double sy)</arglist>
    </member>
    <member kind="function">
      <type>Matrix</type>
      <name>rotation_matrix</name>
      <anchorfile>classCairo_1_1Matrix.html</anchorfile>
      <anchor>a324cadc45a2fe7424cb0d0d6b73ccbe8</anchor>
      <arglist>(double radians)</arglist>
    </member>
    <member kind="function">
      <type>Matrix</type>
      <name>operator*</name>
      <anchorfile>classCairo_1_1Matrix.html</anchorfile>
      <anchor>ab0bbb2ec9c1451f42f0270652df8cada</anchor>
      <arglist>(const Matrix &amp;a, const Matrix &amp;b)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Cairo::Path</name>
    <filename>classCairo_1_1Path.html</filename>
    <member kind="typedef">
      <type>cairo_path_t</type>
      <name>cobject</name>
      <anchorfile>classCairo_1_1Path.html</anchorfile>
      <anchor>a2cd038a379ec386714ca49c9ab4c830b</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Path</name>
      <anchorfile>classCairo_1_1Path.html</anchorfile>
      <anchor>aa4d8ed387279e475eaca70cc80fbb8f3</anchor>
      <arglist>(cairo_path_t *cobject, bool take_ownership=false)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Path</name>
      <anchorfile>classCairo_1_1Path.html</anchorfile>
      <anchor>ab8090e46678ed10981ece7e5a91fb8ab</anchor>
      <arglist>(const Path &amp;)=delete</arglist>
    </member>
    <member kind="function">
      <type>Path &amp;</type>
      <name>operator=</name>
      <anchorfile>classCairo_1_1Path.html</anchorfile>
      <anchor>a87039c0fe307823d5bf2f1c767805bf3</anchor>
      <arglist>(const Path &amp;)=delete</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~Path</name>
      <anchorfile>classCairo_1_1Path.html</anchorfile>
      <anchor>a92f1cc9c567db4b76fa45a7f5a2cbbe5</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>cobject *</type>
      <name>cobj</name>
      <anchorfile>classCairo_1_1Path.html</anchorfile>
      <anchor>a56b488630d56109d6818417697beafe8</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const cobject *</type>
      <name>cobj</name>
      <anchorfile>classCairo_1_1Path.html</anchorfile>
      <anchor>a3519bf3ec4bfcda3b0eb482a72506dae</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>cobject *</type>
      <name>m_cobject</name>
      <anchorfile>classCairo_1_1Path.html</anchorfile>
      <anchor>ae0b434d3681baf1ad366acd762a9f780</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Cairo::Pattern</name>
    <filename>classCairo_1_1Pattern.html</filename>
    <member kind="typedef">
      <type>cairo_pattern_t</type>
      <name>cobject</name>
      <anchorfile>classCairo_1_1Pattern.html</anchorfile>
      <anchor>a430a261a68ae70ca1bd818c781178abc</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Pattern</name>
      <anchorfile>classCairo_1_1Pattern.html</anchorfile>
      <anchor>a2da16a5296c06b65867a1a99e47a4d82</anchor>
      <arglist>(cairo_pattern_t *cobject, bool has_reference=false)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Pattern</name>
      <anchorfile>classCairo_1_1Pattern.html</anchorfile>
      <anchor>a726534a7f081b6c90553cd4d37ef5096</anchor>
      <arglist>(const Pattern &amp;)=delete</arglist>
    </member>
    <member kind="function">
      <type>Pattern &amp;</type>
      <name>operator=</name>
      <anchorfile>classCairo_1_1Pattern.html</anchorfile>
      <anchor>adfa447ad4f86f9f289328fe8a1ee00f3</anchor>
      <arglist>(const Pattern &amp;)=delete</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~Pattern</name>
      <anchorfile>classCairo_1_1Pattern.html</anchorfile>
      <anchor>a62ac06285957869744411527bfb25298</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_matrix</name>
      <anchorfile>classCairo_1_1Pattern.html</anchorfile>
      <anchor>a09dbb1295ba0a4f8a92b571aa6e425af</anchor>
      <arglist>(const Matrix &amp;matrix)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>get_matrix</name>
      <anchorfile>classCairo_1_1Pattern.html</anchorfile>
      <anchor>a7b7a7c1ab2778ed2e44bc8594db3dced</anchor>
      <arglist>(Matrix &amp;matrix) const</arglist>
    </member>
    <member kind="function">
      <type>Matrix</type>
      <name>get_matrix</name>
      <anchorfile>classCairo_1_1Pattern.html</anchorfile>
      <anchor>ac72e5e191630c8d8153156fa97b367f8</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_matrix</name>
      <anchorfile>classCairo_1_1Pattern.html</anchorfile>
      <anchor>aa50a29b9d4c669766355c917ab30b858</anchor>
      <arglist>(const cairo_matrix_t &amp;matrix)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>get_matrix</name>
      <anchorfile>classCairo_1_1Pattern.html</anchorfile>
      <anchor>a7411ab9dd4c2b96c0c7bff9c082db7f3</anchor>
      <arglist>(cairo_matrix_t &amp;matrix) const</arglist>
    </member>
    <member kind="function">
      <type>PatternType</type>
      <name>get_type</name>
      <anchorfile>classCairo_1_1Pattern.html</anchorfile>
      <anchor>aaf3ca9bfaee75bd9c2396be6bd6096bd</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_extend</name>
      <anchorfile>classCairo_1_1Pattern.html</anchorfile>
      <anchor>aa115faded8acf11fa0460a9dae9efc81</anchor>
      <arglist>(Extend extend)</arglist>
    </member>
    <member kind="function">
      <type>Extend</type>
      <name>get_extend</name>
      <anchorfile>classCairo_1_1Pattern.html</anchorfile>
      <anchor>a73c98c1adcbd59fecd185763596590d5</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>cobject *</type>
      <name>cobj</name>
      <anchorfile>classCairo_1_1Pattern.html</anchorfile>
      <anchor>ac638023553708da09383584843240301</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const cobject *</type>
      <name>cobj</name>
      <anchorfile>classCairo_1_1Pattern.html</anchorfile>
      <anchor>a176d1299cba37b1f23be615287901a68</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>reference</name>
      <anchorfile>classCairo_1_1Pattern.html</anchorfile>
      <anchor>ac5c712609d09711e5e3a84613bd65ec0</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>unreference</name>
      <anchorfile>classCairo_1_1Pattern.html</anchorfile>
      <anchor>a30ea30bce54b3663959d4a37ad16757d</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function" protection="protected">
      <type></type>
      <name>Pattern</name>
      <anchorfile>classCairo_1_1Pattern.html</anchorfile>
      <anchor>a41846b1a43050f7ea9aed51bba572247</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>cobject *</type>
      <name>m_cobject</name>
      <anchorfile>classCairo_1_1Pattern.html</anchorfile>
      <anchor>a24fdc166f53a833ba1e1104a5690efbc</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Cairo::PdfSurface</name>
    <filename>classCairo_1_1PdfSurface.html</filename>
    <base>Cairo::Surface</base>
    <member kind="function">
      <type></type>
      <name>PdfSurface</name>
      <anchorfile>classCairo_1_1PdfSurface.html</anchorfile>
      <anchor>ab2da398a2c5b4d0489964eff3adad638</anchor>
      <arglist>(cairo_surface_t *cobject, bool has_reference=false)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~PdfSurface</name>
      <anchorfile>classCairo_1_1PdfSurface.html</anchorfile>
      <anchor>a8e52ae4885b9c2a4db70687e57af4f1a</anchor>
      <arglist>() override</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_size</name>
      <anchorfile>classCairo_1_1PdfSurface.html</anchorfile>
      <anchor>aaae35e5e41a731d3f16f3b238b364bdc</anchor>
      <arglist>(double width_in_points, double height_in_points)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>restrict_to_version</name>
      <anchorfile>classCairo_1_1PdfSurface.html</anchorfile>
      <anchor>aba7ad33d45bfa8c2f3077a8efdeb01e3</anchor>
      <arglist>(PdfVersion version)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; PdfSurface &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1PdfSurface.html</anchorfile>
      <anchor>ae8063a7872cbe1367de91e4dc7e045ce</anchor>
      <arglist>(std::string filename, double width_in_points, double height_in_points)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; PdfSurface &gt;</type>
      <name>create_for_stream</name>
      <anchorfile>classCairo_1_1PdfSurface.html</anchorfile>
      <anchor>a9e8d06b9235a5d3132309c26a16b04b7</anchor>
      <arglist>(const SlotWriteFunc &amp;write_func, double width_in_points, double height_in_points)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; PdfSurface &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1PdfSurface.html</anchorfile>
      <anchor>acbdb9866c8571d4572a8fd537c70ff3e</anchor>
      <arglist>(cairo_write_func_t write_func, void *closure, double width_in_points, double height_in_points)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static const std::vector&lt; PdfVersion &gt;</type>
      <name>get_versions</name>
      <anchorfile>classCairo_1_1PdfSurface.html</anchorfile>
      <anchor>ad5243c86cc7207344cb0428b15bdaeba</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static std::string</type>
      <name>version_to_string</name>
      <anchorfile>classCairo_1_1PdfSurface.html</anchorfile>
      <anchor>a0868e0973fe3c8f1aaff2066c307c3fd</anchor>
      <arglist>(PdfVersion version)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Cairo::PsSurface</name>
    <filename>classCairo_1_1PsSurface.html</filename>
    <base>Cairo::Surface</base>
    <member kind="function">
      <type></type>
      <name>PsSurface</name>
      <anchorfile>classCairo_1_1PsSurface.html</anchorfile>
      <anchor>a0b84b39dd7188da7e785ee8af85374f1</anchor>
      <arglist>(cairo_surface_t *cobject, bool has_reference=false)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~PsSurface</name>
      <anchorfile>classCairo_1_1PsSurface.html</anchorfile>
      <anchor>a654a7fb11162e78093aced541154b91c</anchor>
      <arglist>() override</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_size</name>
      <anchorfile>classCairo_1_1PsSurface.html</anchorfile>
      <anchor>a9de17b1a3db7227a4f16fbf08a4cef2a</anchor>
      <arglist>(double width_in_points, double height_in_points)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>dsc_comment</name>
      <anchorfile>classCairo_1_1PsSurface.html</anchorfile>
      <anchor>a9cd275173ea5dd88eeb485aab614cf92</anchor>
      <arglist>(std::string comment)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>dsc_begin_setup</name>
      <anchorfile>classCairo_1_1PsSurface.html</anchorfile>
      <anchor>a2c72ddaa92aaf109511586e445309131</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>dsc_begin_page_setup</name>
      <anchorfile>classCairo_1_1PsSurface.html</anchorfile>
      <anchor>adcaaa1cf7f554e71f85039424726f6c9</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_eps</name>
      <anchorfile>classCairo_1_1PsSurface.html</anchorfile>
      <anchor>aa2424e42623eb0c410573b465f7b0f00</anchor>
      <arglist>(bool eps)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>get_eps</name>
      <anchorfile>classCairo_1_1PsSurface.html</anchorfile>
      <anchor>af76df13f4f9919eb720829bbfeb70263</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>restrict_to_level</name>
      <anchorfile>classCairo_1_1PsSurface.html</anchorfile>
      <anchor>a2db7043f9b80e2d2082a66ba419b5d46</anchor>
      <arglist>(PsLevel level)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; PsSurface &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1PsSurface.html</anchorfile>
      <anchor>a9d01a5a051581f005cc576d4851b23a4</anchor>
      <arglist>(std::string filename, double width_in_points, double height_in_points)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; PsSurface &gt;</type>
      <name>create_for_stream</name>
      <anchorfile>classCairo_1_1PsSurface.html</anchorfile>
      <anchor>a21c8bdde5525aa1760db3e354cb2af16</anchor>
      <arglist>(const SlotWriteFunc &amp;write_func, double width_in_points, double height_in_points)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; PsSurface &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1PsSurface.html</anchorfile>
      <anchor>a61495c206ac13f897bef9ffec1fe161c</anchor>
      <arglist>(cairo_write_func_t write_func, void *closure, double width_in_points, double height_in_points)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static const std::vector&lt; PsLevel &gt;</type>
      <name>get_levels</name>
      <anchorfile>classCairo_1_1PsSurface.html</anchorfile>
      <anchor>a66e5f21f9a2604f246ed05db41a83906</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static std::string</type>
      <name>level_to_string</name>
      <anchorfile>classCairo_1_1PsSurface.html</anchorfile>
      <anchor>a7afd98b03c189f1761cbe7e90db334dc</anchor>
      <arglist>(PsLevel level)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Cairo::QuartzFontFace</name>
    <filename>classCairo_1_1QuartzFontFace.html</filename>
    <base>Cairo::FontFace</base>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; QuartzFontFace &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1QuartzFontFace.html</anchorfile>
      <anchor>a3aa2160b8fa6369168dfedc6232a45ec</anchor>
      <arglist>(CGFontRef font)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; QuartzFontFace &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1QuartzFontFace.html</anchorfile>
      <anchor>ab8c5254c834adf3b36308334acf9b626</anchor>
      <arglist>(ATSUFontID font_id)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type></type>
      <name>QuartzFontFace</name>
      <anchorfile>classCairo_1_1QuartzFontFace.html</anchorfile>
      <anchor>ace6647ef3cb71b1cae90be9bcc32e973</anchor>
      <arglist>(CGFontRef font)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type></type>
      <name>QuartzFontFace</name>
      <anchorfile>classCairo_1_1QuartzFontFace.html</anchorfile>
      <anchor>ac7df53f82e992f2db387295f8b1d91a1</anchor>
      <arglist>(ATSUFontID font_id)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Cairo::QuartzSurface</name>
    <filename>classCairo_1_1QuartzSurface.html</filename>
    <base>Cairo::Surface</base>
    <member kind="function">
      <type></type>
      <name>QuartzSurface</name>
      <anchorfile>classCairo_1_1QuartzSurface.html</anchorfile>
      <anchor>a14fa4758ee13f117df028455c434c950</anchor>
      <arglist>(cairo_surface_t *cobject, bool has_reference=false)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~QuartzSurface</name>
      <anchorfile>classCairo_1_1QuartzSurface.html</anchorfile>
      <anchor>af77829260a305daa0bfc90fae6c7ed3a</anchor>
      <arglist>() override</arglist>
    </member>
    <member kind="function">
      <type>CGContextRef</type>
      <name>get_cg_context</name>
      <anchorfile>classCairo_1_1QuartzSurface.html</anchorfile>
      <anchor>ae687561561ed99cefc260cc678700d14</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; QuartzSurface &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1QuartzSurface.html</anchorfile>
      <anchor>a060b5f5445c449a3d26da1c96107b6a8</anchor>
      <arglist>(CGContextRef cg_context, int width, int height)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; QuartzSurface &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1QuartzSurface.html</anchorfile>
      <anchor>acbdb3e8fabdbb72147faca0df3a77923</anchor>
      <arglist>(Format format, int width, int height)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Cairo::RadialGradient</name>
    <filename>classCairo_1_1RadialGradient.html</filename>
    <base>Cairo::Gradient</base>
    <member kind="function">
      <type></type>
      <name>RadialGradient</name>
      <anchorfile>classCairo_1_1RadialGradient.html</anchorfile>
      <anchor>a6388284de673c81f1d535ff866ce11ca</anchor>
      <arglist>(cairo_pattern_t *cobject, bool has_reference=false)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>get_radial_circles</name>
      <anchorfile>classCairo_1_1RadialGradient.html</anchorfile>
      <anchor>a988874ca49278861e4a1996c3f6db637</anchor>
      <arglist>(double &amp;x0, double &amp;y0, double &amp;r0, double &amp;x1, double &amp;y1, double &amp;r1) const</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~RadialGradient</name>
      <anchorfile>classCairo_1_1RadialGradient.html</anchorfile>
      <anchor>a7d88baf3cea2a99e6bb5106d52370ba5</anchor>
      <arglist>() override</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; RadialGradient &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1RadialGradient.html</anchorfile>
      <anchor>a1ef72b48f3b22330ea90ebf459e25824</anchor>
      <arglist>(double cx0, double cy0, double radius0, double cx1, double cy1, double radius1)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type></type>
      <name>RadialGradient</name>
      <anchorfile>classCairo_1_1RadialGradient.html</anchorfile>
      <anchor>a59e11d5b13e489bcb590db3152dcfb4f</anchor>
      <arglist>(double cx0, double cy0, double radius0, double cx1, double cy1, double radius1)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Cairo::RecordingSurface</name>
    <filename>classCairo_1_1RecordingSurface.html</filename>
    <base>Cairo::Surface</base>
    <member kind="function">
      <type></type>
      <name>RecordingSurface</name>
      <anchorfile>classCairo_1_1RecordingSurface.html</anchorfile>
      <anchor>aa72a33d3b9ccf56a1b2380befa8ef87a</anchor>
      <arglist>(cairo_surface_t *cobject, bool has_reference=false)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~RecordingSurface</name>
      <anchorfile>classCairo_1_1RecordingSurface.html</anchorfile>
      <anchor>aa43ccc65ef7281be7a06402205243a80</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>Rectangle</type>
      <name>ink_extents</name>
      <anchorfile>classCairo_1_1RecordingSurface.html</anchorfile>
      <anchor>a693b936dccebe39f3bc5941ffae50479</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>get_extents</name>
      <anchorfile>classCairo_1_1RecordingSurface.html</anchorfile>
      <anchor>a8c6c9096b17853afe570ec271500a4b6</anchor>
      <arglist>(Rectangle &amp;extents) const</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; RecordingSurface &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1RecordingSurface.html</anchorfile>
      <anchor>aa99fdddb81d1c928f941ae2acd7336a7</anchor>
      <arglist>(Content content=Content::CONTENT_COLOR_ALPHA)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; RecordingSurface &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1RecordingSurface.html</anchorfile>
      <anchor>a02f8ec048eef8e08f120d1484348644d</anchor>
      <arglist>(const Rectangle &amp;extents, Content content=Content::CONTENT_COLOR_ALPHA)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Cairo::RefPtr</name>
    <filename>classCairo_1_1RefPtr.html</filename>
    <templarg>class T_CppObject</templarg>
    <member kind="function">
      <type></type>
      <name>RefPtr</name>
      <anchorfile>classCairo_1_1RefPtr.html</anchorfile>
      <anchor>ad818ee4774212dbd29112e39e101198e</anchor>
      <arglist>() noexcept</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~RefPtr</name>
      <anchorfile>classCairo_1_1RefPtr.html</anchorfile>
      <anchor>a7449c6c42857a06c601a7564a403ad9a</anchor>
      <arglist>() noexcept</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>RefPtr</name>
      <anchorfile>classCairo_1_1RefPtr.html</anchorfile>
      <anchor>a61ee3e164f0a7248e5b22fe2cf1e74b4</anchor>
      <arglist>(T_CppObject *pCppObject) noexcept</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>RefPtr</name>
      <anchorfile>classCairo_1_1RefPtr.html</anchorfile>
      <anchor>a9571e746dcf28b99e2e51ebae0fb35a1</anchor>
      <arglist>(T_CppObject *pCppObject, int *refcount) noexcept</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>RefPtr</name>
      <anchorfile>classCairo_1_1RefPtr.html</anchorfile>
      <anchor>a33be2213aa14b184a8c2c6477ae6ce3c</anchor>
      <arglist>(RefPtr &amp;&amp;src) noexcept</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>RefPtr</name>
      <anchorfile>classCairo_1_1RefPtr.html</anchorfile>
      <anchor>a8d2a9e0461793104b51efbef7f73d355</anchor>
      <arglist>(RefPtr&lt; T_CastFrom &gt; &amp;&amp;src) noexcept</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>RefPtr</name>
      <anchorfile>classCairo_1_1RefPtr.html</anchorfile>
      <anchor>a41f1ceed87262d3148b1797c526d788a</anchor>
      <arglist>(const RefPtr&lt; T_CppObject &gt; &amp;src) noexcept</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>RefPtr</name>
      <anchorfile>classCairo_1_1RefPtr.html</anchorfile>
      <anchor>a942f1d647bfccfda787fd70751ab1832</anchor>
      <arglist>(const RefPtr&lt; T_CastFrom &gt; &amp;src) noexcept</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>swap</name>
      <anchorfile>classCairo_1_1RefPtr.html</anchorfile>
      <anchor>ae60f24b9b0751786b78d83962f1312a2</anchor>
      <arglist>(RefPtr&lt; T_CppObject &gt; &amp;other) noexcept</arglist>
    </member>
    <member kind="function">
      <type>RefPtr&lt; T_CppObject &gt; &amp;</type>
      <name>operator=</name>
      <anchorfile>classCairo_1_1RefPtr.html</anchorfile>
      <anchor>ac188db102a89751ea2e617cade87ecd1</anchor>
      <arglist>(const RefPtr&lt; T_CppObject &gt; &amp;src) noexcept</arglist>
    </member>
    <member kind="function">
      <type>RefPtr&lt; T_CppObject &gt; &amp;</type>
      <name>operator=</name>
      <anchorfile>classCairo_1_1RefPtr.html</anchorfile>
      <anchor>a98ec5775b4ffaf18689e67af1c1908af</anchor>
      <arglist>(const RefPtr&lt; T_CastFrom &gt; &amp;src) noexcept</arglist>
    </member>
    <member kind="function">
      <type>RefPtr &amp;</type>
      <name>operator=</name>
      <anchorfile>classCairo_1_1RefPtr.html</anchorfile>
      <anchor>abaa2b745e3508d7800656628700d405d</anchor>
      <arglist>(RefPtr &amp;&amp;src) noexcept</arglist>
    </member>
    <member kind="function">
      <type>RefPtr &amp;</type>
      <name>operator=</name>
      <anchorfile>classCairo_1_1RefPtr.html</anchorfile>
      <anchor>ab9cca952eb5c9700b6d87113100b44c1</anchor>
      <arglist>(RefPtr&lt; T_CastFrom &gt; &amp;&amp;src) noexcept</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>operator==</name>
      <anchorfile>classCairo_1_1RefPtr.html</anchorfile>
      <anchor>a6bc4844686505c04065879ede5c325f0</anchor>
      <arglist>(const RefPtr&lt; T_CppObject &gt; &amp;src) const noexcept</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>operator!=</name>
      <anchorfile>classCairo_1_1RefPtr.html</anchorfile>
      <anchor>a6374fdf5a0c78115afa0567b7b2c1731</anchor>
      <arglist>(const RefPtr&lt; T_CppObject &gt; &amp;src) const noexcept</arglist>
    </member>
    <member kind="function">
      <type>T_CppObject *</type>
      <name>operator-&gt;</name>
      <anchorfile>classCairo_1_1RefPtr.html</anchorfile>
      <anchor>a6af0b26f9c0877fb39de7985c12976c8</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>operator bool</name>
      <anchorfile>classCairo_1_1RefPtr.html</anchorfile>
      <anchor>a18040dd7243379ed6689c57c093ad19c</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>clear</name>
      <anchorfile>classCairo_1_1RefPtr.html</anchorfile>
      <anchor>a65770debda718f499a5139a5b68ac5a0</anchor>
      <arglist>() noexcept</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; T_CppObject &gt;</type>
      <name>cast_dynamic</name>
      <anchorfile>classCairo_1_1RefPtr.html</anchorfile>
      <anchor>a35cc693692a2ecdb7e06675ae78a1280</anchor>
      <arglist>(const RefPtr&lt; T_CastFrom &gt; &amp;src) noexcept</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; T_CppObject &gt;</type>
      <name>cast_static</name>
      <anchorfile>classCairo_1_1RefPtr.html</anchorfile>
      <anchor>a74426e8ddc687694ac25e4aba9394646</anchor>
      <arglist>(const RefPtr&lt; T_CastFrom &gt; &amp;src) noexcept</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; T_CppObject &gt;</type>
      <name>cast_const</name>
      <anchorfile>classCairo_1_1RefPtr.html</anchorfile>
      <anchor>a7c60d869675fc3fa62b4da3f84d0ee42</anchor>
      <arglist>(const RefPtr&lt; T_CastFrom &gt; &amp;src) noexcept</arglist>
    </member>
    <member kind="friend">
      <type>friend class</type>
      <name>RefPtr</name>
      <anchorfile>classCairo_1_1RefPtr.html</anchorfile>
      <anchor>a161a8052754985bb8024c19c06fd9206</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Cairo::Region</name>
    <filename>classCairo_1_1Region.html</filename>
    <member kind="typedef">
      <type>cairo_region_t</type>
      <name>cobject</name>
      <anchorfile>classCairo_1_1Region.html</anchorfile>
      <anchor>af8c09f4cc72ba034d56a3bd60522e637</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Region</name>
      <anchorfile>classCairo_1_1Region.html</anchorfile>
      <anchor>a0e41a220dd0ef49e142d1bb3b5fb6097</anchor>
      <arglist>(cairo_region_t *cobject, bool has_reference=false)</arglist>
    </member>
    <member kind="function">
      <type>RefPtr&lt; Region &gt;</type>
      <name>copy</name>
      <anchorfile>classCairo_1_1Region.html</anchorfile>
      <anchor>a4453cebafc11942a215b49ce909527bc</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~Region</name>
      <anchorfile>classCairo_1_1Region.html</anchorfile>
      <anchor>a78501f7dd77e97842b0ea09541ce4bfa</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>RectangleInt</type>
      <name>get_extents</name>
      <anchorfile>classCairo_1_1Region.html</anchorfile>
      <anchor>a4f4d5ed5c94ce48860622a106f7c439a</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>get_num_rectangles</name>
      <anchorfile>classCairo_1_1Region.html</anchorfile>
      <anchor>afc7a01715c6712eb2ed0445161154ca2</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>RectangleInt</type>
      <name>get_rectangle</name>
      <anchorfile>classCairo_1_1Region.html</anchorfile>
      <anchor>a0c063ed8193056ca010ee997be505534</anchor>
      <arglist>(int nth_rectangle) const</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>empty</name>
      <anchorfile>classCairo_1_1Region.html</anchorfile>
      <anchor>a3f430f7580adcf4888213acfff4564a1</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>RegionOverlap</type>
      <name>contains_rectangle</name>
      <anchorfile>classCairo_1_1Region.html</anchorfile>
      <anchor>a58c75596acfcf804267e2de599e0bc9a</anchor>
      <arglist>(const RectangleInt &amp;rectangle) const</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>contains_point</name>
      <anchorfile>classCairo_1_1Region.html</anchorfile>
      <anchor>a15fac8ae752a0c8859ea9711f7f09614</anchor>
      <arglist>(int x, int y) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>translate</name>
      <anchorfile>classCairo_1_1Region.html</anchorfile>
      <anchor>a2b234a3304e793ebe8f311c27ac0e671</anchor>
      <arglist>(int dx, int dy)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>subtract</name>
      <anchorfile>classCairo_1_1Region.html</anchorfile>
      <anchor>a217e555bf5b8cc178b1365350205066f</anchor>
      <arglist>(const RefPtr&lt; Region &gt; &amp;other)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>subtract</name>
      <anchorfile>classCairo_1_1Region.html</anchorfile>
      <anchor>a105c98b3ec5aeb37d535b68de32f82a0</anchor>
      <arglist>(const RectangleInt &amp;rectangle)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>intersect</name>
      <anchorfile>classCairo_1_1Region.html</anchorfile>
      <anchor>a19c92f7e27d934862a94dfe1630b5030</anchor>
      <arglist>(const RefPtr&lt; Region &gt; &amp;other)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>intersect</name>
      <anchorfile>classCairo_1_1Region.html</anchorfile>
      <anchor>aef3f748e826d3f7c6d7a8703de43a021</anchor>
      <arglist>(const RectangleInt &amp;rectangle)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>do_union</name>
      <anchorfile>classCairo_1_1Region.html</anchorfile>
      <anchor>aed4efa91fe59b807f4e4aab91d680d6f</anchor>
      <arglist>(const RefPtr&lt; Region &gt; &amp;other)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>do_union</name>
      <anchorfile>classCairo_1_1Region.html</anchorfile>
      <anchor>a30a134ddda2390ec5cbfadc88ab18227</anchor>
      <arglist>(const RectangleInt &amp;rectangle)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>do_xor</name>
      <anchorfile>classCairo_1_1Region.html</anchorfile>
      <anchor>a8959bebdeaf4977bc14d86bf0e3967d6</anchor>
      <arglist>(const RefPtr&lt; Region &gt; &amp;other)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>do_xor</name>
      <anchorfile>classCairo_1_1Region.html</anchorfile>
      <anchor>a6c3e8695ac0313eb9342376a6cd20230</anchor>
      <arglist>(const RectangleInt &amp;rectangle)</arglist>
    </member>
    <member kind="function">
      <type>cobject *</type>
      <name>cobj</name>
      <anchorfile>classCairo_1_1Region.html</anchorfile>
      <anchor>a3c00d29c6823310d6e18cc24d8bb84c3</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const cobject *</type>
      <name>cobj</name>
      <anchorfile>classCairo_1_1Region.html</anchorfile>
      <anchor>ad7e7457230a410a04940371f7502401f</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>reference</name>
      <anchorfile>classCairo_1_1Region.html</anchorfile>
      <anchor>abcaf5f1c32dbd5b74a72955aef7ad876</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>unreference</name>
      <anchorfile>classCairo_1_1Region.html</anchorfile>
      <anchor>a334ca340495fa0cbc5821eb9f144843e</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; Region &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1Region.html</anchorfile>
      <anchor>abd8c2027d3567c6eb92bcd72ea79c6d1</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; Region &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1Region.html</anchorfile>
      <anchor>ab0debc2c68a99a31434696489b557aef</anchor>
      <arglist>(const RectangleInt &amp;rectangle)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; Region &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1Region.html</anchorfile>
      <anchor>a9328cb98bf81c6a4970be9427f732c35</anchor>
      <arglist>(const std::vector&lt; RectangleInt &gt; &amp;rects)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; Region &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1Region.html</anchorfile>
      <anchor>a00300ccfca99c6d4a418bb5e93afea92</anchor>
      <arglist>(const RectangleInt *rects, int count)</arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>cobject *</type>
      <name>m_cobject</name>
      <anchorfile>classCairo_1_1Region.html</anchorfile>
      <anchor>ac06aecabce2907283147392f00c85106</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Cairo::ScaledFont</name>
    <filename>classCairo_1_1ScaledFont.html</filename>
    <member kind="typedef">
      <type>cairo_scaled_font_t</type>
      <name>cobject</name>
      <anchorfile>classCairo_1_1ScaledFont.html</anchorfile>
      <anchor>a2d6be7ee16b4cbdcff67e6fdf3682b2a</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>cobject *</type>
      <name>cobj</name>
      <anchorfile>classCairo_1_1ScaledFont.html</anchorfile>
      <anchor>a7b581dcb631ef396d663433605f9eb32</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const cobject *</type>
      <name>cobj</name>
      <anchorfile>classCairo_1_1ScaledFont.html</anchorfile>
      <anchor>a017f0144ef2215f6810e6911a4b695ae</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>ScaledFont</name>
      <anchorfile>classCairo_1_1ScaledFont.html</anchorfile>
      <anchor>a4407baae7eda0bf820e7c38596edcf7f</anchor>
      <arglist>(cobject *cobj, bool has_reference=false)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>ScaledFont</name>
      <anchorfile>classCairo_1_1ScaledFont.html</anchorfile>
      <anchor>ae3ff6bbdce79b4920b7ee563a61f0202</anchor>
      <arglist>(const ScaledFont &amp;)=delete</arglist>
    </member>
    <member kind="function">
      <type>ScaledFont &amp;</type>
      <name>operator=</name>
      <anchorfile>classCairo_1_1ScaledFont.html</anchorfile>
      <anchor>af8b6714eb5c6deef356c864589ffc4fb</anchor>
      <arglist>(const ScaledFont &amp;)=delete</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~ScaledFont</name>
      <anchorfile>classCairo_1_1ScaledFont.html</anchorfile>
      <anchor>ae6cfed04a0d3e4d4a0e63ddc1c6c76c4</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>get_extents</name>
      <anchorfile>classCairo_1_1ScaledFont.html</anchorfile>
      <anchor>a894375fdbb8bb510dfa406f9952b934b</anchor>
      <arglist>(FontExtents &amp;extents) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>extents</name>
      <anchorfile>classCairo_1_1ScaledFont.html</anchorfile>
      <anchor>a2f26c9253a54e59b62ebb1b421799c55</anchor>
      <arglist>(FontExtents &amp;extents) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>get_text_extents</name>
      <anchorfile>classCairo_1_1ScaledFont.html</anchorfile>
      <anchor>a01bdae41a545857aa49faa9c306150aa</anchor>
      <arglist>(const std::string &amp;utf8, TextExtents &amp;extents) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>text_extents</name>
      <anchorfile>classCairo_1_1ScaledFont.html</anchorfile>
      <anchor>a03537a779c3c6d8dc08878164d52eb18</anchor>
      <arglist>(const std::string &amp;utf8, TextExtents &amp;extents) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>get_glyph_extents</name>
      <anchorfile>classCairo_1_1ScaledFont.html</anchorfile>
      <anchor>aabfe38c6ca3e1c575b85aa7094e8601d</anchor>
      <arglist>(const std::vector&lt; Glyph &gt; &amp;glyphs, TextExtents &amp;extents)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>glyph_extents</name>
      <anchorfile>classCairo_1_1ScaledFont.html</anchorfile>
      <anchor>a859bbee5886b15e1d8ab599dabab9833</anchor>
      <arglist>(const std::vector&lt; Glyph &gt; &amp;glyphs, TextExtents &amp;extents)</arglist>
    </member>
    <member kind="function">
      <type>RefPtr&lt; FontFace &gt;</type>
      <name>get_font_face</name>
      <anchorfile>classCairo_1_1ScaledFont.html</anchorfile>
      <anchor>a007189fe12b8f1297277a3edc3c05f9b</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>get_font_options</name>
      <anchorfile>classCairo_1_1ScaledFont.html</anchorfile>
      <anchor>a1f3e7b38a2e9278288ccda2838caa903</anchor>
      <arglist>(FontOptions &amp;options) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>get_font_matrix</name>
      <anchorfile>classCairo_1_1ScaledFont.html</anchorfile>
      <anchor>a243c5bc066ea0d899dc442d4746fc749</anchor>
      <arglist>(Matrix &amp;font_matrix) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>get_font_matrix</name>
      <anchorfile>classCairo_1_1ScaledFont.html</anchorfile>
      <anchor>abe3b2d2eb1269b847804942deacf6d8f</anchor>
      <arglist>(cairo_matrix_t &amp;font_matrix) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>get_ctm</name>
      <anchorfile>classCairo_1_1ScaledFont.html</anchorfile>
      <anchor>a9fc9bc1a087135add40d5c2f5918765c</anchor>
      <arglist>(Matrix &amp;ctm) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>get_ctm</name>
      <anchorfile>classCairo_1_1ScaledFont.html</anchorfile>
      <anchor>a8d2007445b8aab94771650f0c14c6520</anchor>
      <arglist>(cairo_matrix_t &amp;ctm) const</arglist>
    </member>
    <member kind="function">
      <type>FontType</type>
      <name>get_type</name>
      <anchorfile>classCairo_1_1ScaledFont.html</anchorfile>
      <anchor>a15faedd4d38af1b49c9c2c4a0d7e21bf</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>text_to_glyphs</name>
      <anchorfile>classCairo_1_1ScaledFont.html</anchorfile>
      <anchor>abf1bb0d07de65cc8d8f7e64d83f0be26</anchor>
      <arglist>(double x, double y, const std::string &amp;utf8, std::vector&lt; Glyph &gt; &amp;glyphs, std::vector&lt; TextCluster &gt; &amp;clusters, TextClusterFlags &amp;cluster_flags)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>get_scale_matrix</name>
      <anchorfile>classCairo_1_1ScaledFont.html</anchorfile>
      <anchor>a11ab2662ccb4bd5ecee217fc35349fd4</anchor>
      <arglist>(Matrix &amp;scale_matrix) const</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; ScaledFont &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1ScaledFont.html</anchorfile>
      <anchor>a938831d338ffc8ac0bbdbd47ec2234e1</anchor>
      <arglist>(const RefPtr&lt; FontFace &gt; &amp;font_face, const Matrix &amp;font_matrix, const Matrix &amp;ctm, const FontOptions &amp;options=FontOptions())</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; ScaledFont &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1ScaledFont.html</anchorfile>
      <anchor>a9ba595c639de0560a1e565cd7ec008ee</anchor>
      <arglist>(const RefPtr&lt; FontFace &gt; &amp;font_face, const cairo_matrix_t &amp;font_matrix, const cairo_matrix_t &amp;ctm, const FontOptions &amp;options=FontOptions())</arglist>
    </member>
    <member kind="function" protection="protected">
      <type></type>
      <name>ScaledFont</name>
      <anchorfile>classCairo_1_1ScaledFont.html</anchorfile>
      <anchor>aca31f49f3121d2a6673205bebe7720c0</anchor>
      <arglist>(const RefPtr&lt; FontFace &gt; &amp;font_face, const cairo_matrix_t &amp;font_matrix, const cairo_matrix_t &amp;ctm, const FontOptions &amp;options=FontOptions())</arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>cobject *</type>
      <name>m_cobject</name>
      <anchorfile>classCairo_1_1ScaledFont.html</anchorfile>
      <anchor>aa6f45de0a89807dd6678029807227757</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Cairo::SolidPattern</name>
    <filename>classCairo_1_1SolidPattern.html</filename>
    <base>Cairo::Pattern</base>
    <member kind="function">
      <type></type>
      <name>SolidPattern</name>
      <anchorfile>classCairo_1_1SolidPattern.html</anchorfile>
      <anchor>aac3f148e302049ae30954f946efda12a</anchor>
      <arglist>(cairo_pattern_t *cobject, bool has_reference=false)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>get_rgba</name>
      <anchorfile>classCairo_1_1SolidPattern.html</anchorfile>
      <anchor>a2aa0387b9124683d7b79d9a48ba66f68</anchor>
      <arglist>(double &amp;red, double &amp;green, double &amp;blue, double &amp;alpha) const</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~SolidPattern</name>
      <anchorfile>classCairo_1_1SolidPattern.html</anchorfile>
      <anchor>a995a32b221b5d41b85e03d3b4db6a151</anchor>
      <arglist>() override</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; SolidPattern &gt;</type>
      <name>create_rgb</name>
      <anchorfile>classCairo_1_1SolidPattern.html</anchorfile>
      <anchor>a08f258736c6a92a76ee73dc39ed2b335</anchor>
      <arglist>(double red, double green, double blue)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; SolidPattern &gt;</type>
      <name>create_rgba</name>
      <anchorfile>classCairo_1_1SolidPattern.html</anchorfile>
      <anchor>abd5ef1e8cdb99351a1f0b31c1349a61b</anchor>
      <arglist>(double red, double green, double blue, double alpha)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Cairo::Surface</name>
    <filename>classCairo_1_1Surface.html</filename>
    <member kind="typedef">
      <type>sigc::slot&lt; ErrorStatus, const unsigned char *, unsigned int &gt;</type>
      <name>SlotWriteFunc</name>
      <anchorfile>classCairo_1_1Surface.html</anchorfile>
      <anchor>a02fb9416d466b762bc5845b0ae204f49</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>sigc::slot&lt; ErrorStatus, unsigned char *, unsigned int &gt;</type>
      <name>SlotReadFunc</name>
      <anchorfile>classCairo_1_1Surface.html</anchorfile>
      <anchor>af66be8453e3fc558ea1282a911bf60e2</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>sigc::slot&lt; void &gt;</type>
      <name>SlotDestroy</name>
      <anchorfile>classCairo_1_1Surface.html</anchorfile>
      <anchor>a150d8ae84fa994f8e2032caa525c166a</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>cairo_surface_t</type>
      <name>cobject</name>
      <anchorfile>classCairo_1_1Surface.html</anchorfile>
      <anchor>ad176eb7343b5902df3c19f9f56e59fb4</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Surface</name>
      <anchorfile>classCairo_1_1Surface.html</anchorfile>
      <anchor>a47b90669a5a85d187cc0d28dc99915c8</anchor>
      <arglist>(cairo_surface_t *cobject, bool has_reference=false)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Surface</name>
      <anchorfile>classCairo_1_1Surface.html</anchorfile>
      <anchor>a7d0d7fe23fdbf6aeab62cf240a1fb434</anchor>
      <arglist>(const Surface &amp;)=delete</arglist>
    </member>
    <member kind="function">
      <type>Surface &amp;</type>
      <name>operator=</name>
      <anchorfile>classCairo_1_1Surface.html</anchorfile>
      <anchor>addcd247fad43481841c360c44596e148</anchor>
      <arglist>(const Surface &amp;)=delete</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~Surface</name>
      <anchorfile>classCairo_1_1Surface.html</anchorfile>
      <anchor>a64ca52e9e8e9a64358ff85e6ef0d93c1</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const unsigned char *</type>
      <name>get_mime_data</name>
      <anchorfile>classCairo_1_1Surface.html</anchorfile>
      <anchor>ac468454406b6115c844b2860d322bbb9</anchor>
      <arglist>(const std::string &amp;mime_type, unsigned long &amp;length)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_mime_data</name>
      <anchorfile>classCairo_1_1Surface.html</anchorfile>
      <anchor>a7c572103fe56f7c6d0b83f2986338f82</anchor>
      <arglist>(const std::string &amp;mime_type, unsigned char *data, unsigned long length, const SlotDestroy &amp;slot_destroy)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>unset_mime_data</name>
      <anchorfile>classCairo_1_1Surface.html</anchorfile>
      <anchor>a5074b0c28c547802824d6d6cd2b0b8b5</anchor>
      <arglist>(const std::string &amp;mime_type)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>get_font_options</name>
      <anchorfile>classCairo_1_1Surface.html</anchorfile>
      <anchor>a2fed4b3cb3221b01456da3a3eebdbc4d</anchor>
      <arglist>(FontOptions &amp;options) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>finish</name>
      <anchorfile>classCairo_1_1Surface.html</anchorfile>
      <anchor>a8d8afee4ddb4935b85698f27099646a0</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>flush</name>
      <anchorfile>classCairo_1_1Surface.html</anchorfile>
      <anchor>a8f95678918fb40bae15f8aad2adb6ef2</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>mark_dirty</name>
      <anchorfile>classCairo_1_1Surface.html</anchorfile>
      <anchor>a77b1f860cc55f4ad168e100108e0b7bb</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>mark_dirty</name>
      <anchorfile>classCairo_1_1Surface.html</anchorfile>
      <anchor>a1dbf3a036b7dc7c09fc86996ea1ee61f</anchor>
      <arglist>(int x, int y, int width, int height)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_device_offset</name>
      <anchorfile>classCairo_1_1Surface.html</anchorfile>
      <anchor>a957e290a548d3cba65aa9e3fd0c86180</anchor>
      <arglist>(double x_offset, double y_offset)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>get_device_offset</name>
      <anchorfile>classCairo_1_1Surface.html</anchorfile>
      <anchor>a67fb22083db42e1556441e0736faf539</anchor>
      <arglist>(double &amp;x_offset, double &amp;y_offset) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_fallback_resolution</name>
      <anchorfile>classCairo_1_1Surface.html</anchorfile>
      <anchor>ac8caca30702fe2bd69ae89929ee784e8</anchor>
      <arglist>(double x_pixels_per_inch, double y_pixels_per_inch)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>get_fallback_resolution</name>
      <anchorfile>classCairo_1_1Surface.html</anchorfile>
      <anchor>acfffebb20bdf5b026e0e4f4751812347</anchor>
      <arglist>(double &amp;x_pixels_per_inch, double &amp;y_pixels_per_inch) const</arglist>
    </member>
    <member kind="function">
      <type>SurfaceType</type>
      <name>get_type</name>
      <anchorfile>classCairo_1_1Surface.html</anchorfile>
      <anchor>ab2ebdef8d1c76dea38de87bc3fc8d604</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>Content</type>
      <name>get_content</name>
      <anchorfile>classCairo_1_1Surface.html</anchorfile>
      <anchor>ad17e281b6bdba2c4e4a5446d2518c648</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>copy_page</name>
      <anchorfile>classCairo_1_1Surface.html</anchorfile>
      <anchor>aae22bcaa9becbf3ca703a380f70c2c0a</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>show_page</name>
      <anchorfile>classCairo_1_1Surface.html</anchorfile>
      <anchor>ad318acd86c1875854ef4e1e2867052c3</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>has_show_text_glyphs</name>
      <anchorfile>classCairo_1_1Surface.html</anchorfile>
      <anchor>a2a355ab83be6581381594d0cb20104cc</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>write_to_png</name>
      <anchorfile>classCairo_1_1Surface.html</anchorfile>
      <anchor>a153405d271814ab4d47b90a1c36d2370</anchor>
      <arglist>(const std::string &amp;filename)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>write_to_png_stream</name>
      <anchorfile>classCairo_1_1Surface.html</anchorfile>
      <anchor>ab3eca5bc13abe27f470fdf08134269bb</anchor>
      <arglist>(const SlotWriteFunc &amp;write_func)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>write_to_png</name>
      <anchorfile>classCairo_1_1Surface.html</anchorfile>
      <anchor>a83763b7906a666b095ce376271455457</anchor>
      <arglist>(cairo_write_func_t write_func, void *closure)</arglist>
    </member>
    <member kind="function">
      <type>RefPtr&lt; Device &gt;</type>
      <name>get_device</name>
      <anchorfile>classCairo_1_1Surface.html</anchorfile>
      <anchor>a11722bf2552319e04e0823dfd17a63d5</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>cobject *</type>
      <name>cobj</name>
      <anchorfile>classCairo_1_1Surface.html</anchorfile>
      <anchor>af77d35662d58a96eb1a0d4b966ae025e</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const cobject *</type>
      <name>cobj</name>
      <anchorfile>classCairo_1_1Surface.html</anchorfile>
      <anchor>af389ea97ea5ddcdda36c6be4286fb792</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; Surface &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1Surface.html</anchorfile>
      <anchor>a43b69e34f812310e0cf180b4d94627ba</anchor>
      <arglist>(const RefPtr&lt; Surface &gt; other, Content content, int width, int height)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; Surface &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1Surface.html</anchorfile>
      <anchor>ad97d8e931d299e08fe0af879d47ee9d1</anchor>
      <arglist>(const RefPtr&lt; Surface &gt; &amp;target, double x, double y, double width, double height)</arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>cobject *</type>
      <name>m_cobject</name>
      <anchorfile>classCairo_1_1Surface.html</anchorfile>
      <anchor>a8c9aea28f0d1f6c2dcb507a2c7bb027c</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Cairo::SurfacePattern</name>
    <filename>classCairo_1_1SurfacePattern.html</filename>
    <base>Cairo::Pattern</base>
    <member kind="function">
      <type></type>
      <name>SurfacePattern</name>
      <anchorfile>classCairo_1_1SurfacePattern.html</anchorfile>
      <anchor>a9461babece82be067b48e6491c7ab1ad</anchor>
      <arglist>(cairo_pattern_t *cobject, bool has_reference=false)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~SurfacePattern</name>
      <anchorfile>classCairo_1_1SurfacePattern.html</anchorfile>
      <anchor>adc5254ec79acdaa6985d7fe2a527e45f</anchor>
      <arglist>() override</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_extend</name>
      <anchorfile>classCairo_1_1SurfacePattern.html</anchorfile>
      <anchor>a8b238004a061f34425ee61a2ba494632</anchor>
      <arglist>(Extend extend)</arglist>
    </member>
    <member kind="function">
      <type>Extend</type>
      <name>get_extend</name>
      <anchorfile>classCairo_1_1SurfacePattern.html</anchorfile>
      <anchor>a7c97d8a59fb8492d22583e6f40c81f77</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_filter</name>
      <anchorfile>classCairo_1_1SurfacePattern.html</anchorfile>
      <anchor>a4d1517f554ffb2821e939aed01899022</anchor>
      <arglist>(Filter filter)</arglist>
    </member>
    <member kind="function">
      <type>Filter</type>
      <name>get_filter</name>
      <anchorfile>classCairo_1_1SurfacePattern.html</anchorfile>
      <anchor>a16af91ba5407e35411818ab339f6ec12</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>RefPtr&lt; const Surface &gt;</type>
      <name>get_surface</name>
      <anchorfile>classCairo_1_1SurfacePattern.html</anchorfile>
      <anchor>ad2003267ed3a334500d627de363dcc5d</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>RefPtr&lt; Surface &gt;</type>
      <name>get_surface</name>
      <anchorfile>classCairo_1_1SurfacePattern.html</anchorfile>
      <anchor>a724b2cdd337b8954f135a7790c9e2913</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; SurfacePattern &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1SurfacePattern.html</anchorfile>
      <anchor>a816e89e6bf7b009cbad7a80d52453d12</anchor>
      <arglist>(const RefPtr&lt; Surface &gt; &amp;surface)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type></type>
      <name>SurfacePattern</name>
      <anchorfile>classCairo_1_1SurfacePattern.html</anchorfile>
      <anchor>a69b713eb59cec9ef25f586d6f14c2dda</anchor>
      <arglist>(const RefPtr&lt; Surface &gt; &amp;surface)</arglist>
    </member>
    <member kind="function">
      <type>RefPtr&lt; const Surface &gt;</type>
      <name>get_surface</name>
      <anchorfile>classCairo_1_1SurfacePattern.html</anchorfile>
      <anchor>ad2003267ed3a334500d627de363dcc5d</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>RefPtr&lt; Surface &gt;</type>
      <name>get_surface</name>
      <anchorfile>classCairo_1_1SurfacePattern.html</anchorfile>
      <anchor>a724b2cdd337b8954f135a7790c9e2913</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Cairo::SvgSurface</name>
    <filename>classCairo_1_1SvgSurface.html</filename>
    <base>Cairo::Surface</base>
    <member kind="function">
      <type></type>
      <name>SvgSurface</name>
      <anchorfile>classCairo_1_1SvgSurface.html</anchorfile>
      <anchor>a67303207546ee57abfa62d4d0892575f</anchor>
      <arglist>(cairo_surface_t *cobject, bool has_reference=false)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~SvgSurface</name>
      <anchorfile>classCairo_1_1SvgSurface.html</anchorfile>
      <anchor>a13230251ef04ac57642a62e8a733b9fa</anchor>
      <arglist>() override</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>restrict_to_version</name>
      <anchorfile>classCairo_1_1SvgSurface.html</anchorfile>
      <anchor>a4ac854641fe28b16c5e01582d91e22dc</anchor>
      <arglist>(SvgVersion version)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; SvgSurface &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1SvgSurface.html</anchorfile>
      <anchor>a90fdbe8ba35ec57a15c28b2b856591e6</anchor>
      <arglist>(std::string filename, double width_in_points, double height_in_points)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; SvgSurface &gt;</type>
      <name>create_for_stream</name>
      <anchorfile>classCairo_1_1SvgSurface.html</anchorfile>
      <anchor>ab7fe4755e0470a398e669fdb14ed8797</anchor>
      <arglist>(const SlotWriteFunc &amp;write_func, double width_in_points, double height_in_points)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; SvgSurface &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1SvgSurface.html</anchorfile>
      <anchor>a77b876cab37e8035d192ca76b3729f3e</anchor>
      <arglist>(cairo_write_func_t write_func, void *closure, double width_in_points, double height_in_points)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static const std::vector&lt; SvgVersion &gt;</type>
      <name>get_versions</name>
      <anchorfile>classCairo_1_1SvgSurface.html</anchorfile>
      <anchor>aac3e1a7c59a39fa536ab7ee7aff756f0</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static std::string</type>
      <name>version_to_string</name>
      <anchorfile>classCairo_1_1SvgSurface.html</anchorfile>
      <anchor>a3a15a5df131a8ef6cc8786342c7e6dfc</anchor>
      <arglist>(SvgVersion version)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Cairo::ToyFontFace</name>
    <filename>classCairo_1_1ToyFontFace.html</filename>
    <base>Cairo::FontFace</base>
    <member kind="function">
      <type>std::string</type>
      <name>get_family</name>
      <anchorfile>classCairo_1_1ToyFontFace.html</anchorfile>
      <anchor>a109ef45a404b61c8f2f4c33c864916ac</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>FontSlant</type>
      <name>get_slant</name>
      <anchorfile>classCairo_1_1ToyFontFace.html</anchorfile>
      <anchor>a3c1f45415fa65c2382af139c7500cc1e</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>FontWeight</type>
      <name>get_weight</name>
      <anchorfile>classCairo_1_1ToyFontFace.html</anchorfile>
      <anchor>aa9090b3ac223d2cc484b0dc753d4118b</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; ToyFontFace &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1ToyFontFace.html</anchorfile>
      <anchor>acd1ebadba7c4af571904092bfea0851f</anchor>
      <arglist>(const std::string &amp;family, FontSlant slant, FontWeight weight)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type></type>
      <name>ToyFontFace</name>
      <anchorfile>classCairo_1_1ToyFontFace.html</anchorfile>
      <anchor>a78612cc2a17fda1953c54ef15bc84dcf</anchor>
      <arglist>(const std::string &amp;family, FontSlant slant, FontWeight weight)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Cairo::UserFontFace</name>
    <filename>classCairo_1_1UserFontFace.html</filename>
    <base>Cairo::FontFace</base>
    <member kind="function">
      <type></type>
      <name>~UserFontFace</name>
      <anchorfile>classCairo_1_1UserFontFace.html</anchorfile>
      <anchor>aaca1460e62864e383e0c15fbb2fc5e89</anchor>
      <arglist>() override</arglist>
    </member>
    <member kind="function" protection="protected" virtualness="virtual">
      <type>virtual ErrorStatus</type>
      <name>init</name>
      <anchorfile>classCairo_1_1UserFontFace.html</anchorfile>
      <anchor>af3f1d3a53a7be1d84a20609984473e07</anchor>
      <arglist>(const RefPtr&lt; ScaledFont &gt; &amp;scaled_font, const RefPtr&lt; Context &gt; &amp;cr, FontExtents &amp;extents)</arglist>
    </member>
    <member kind="function" protection="protected" virtualness="virtual">
      <type>virtual ErrorStatus</type>
      <name>unicode_to_glyph</name>
      <anchorfile>classCairo_1_1UserFontFace.html</anchorfile>
      <anchor>a43cd65b62eab686477d3773e6fd98b46</anchor>
      <arglist>(const RefPtr&lt; ScaledFont &gt; &amp;scaled_font, unsigned long unicode, unsigned long &amp;glyph)</arglist>
    </member>
    <member kind="function" protection="protected" virtualness="pure">
      <type>virtual ErrorStatus</type>
      <name>render_glyph</name>
      <anchorfile>classCairo_1_1UserFontFace.html</anchorfile>
      <anchor>a2e53435e92f9975213bd19969cb69375</anchor>
      <arglist>(const RefPtr&lt; ScaledFont &gt; &amp;scaled_font, unsigned long glyph, const RefPtr&lt; Context &gt; &amp;cr, TextExtents &amp;metrics)=0</arglist>
    </member>
    <member kind="function" protection="protected" virtualness="virtual">
      <type>virtual ErrorStatus</type>
      <name>text_to_glyphs</name>
      <anchorfile>classCairo_1_1UserFontFace.html</anchorfile>
      <anchor>a467db4c4a08c8cced992045d791e65f2</anchor>
      <arglist>(const RefPtr&lt; ScaledFont &gt; &amp;scaled_font, const std::string &amp;utf8, std::vector&lt; Glyph &gt; &amp;glyphs, std::vector&lt; TextCluster &gt; &amp;clusters, TextClusterFlags &amp;cluster_flags)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type></type>
      <name>UserFontFace</name>
      <anchorfile>classCairo_1_1UserFontFace.html</anchorfile>
      <anchor>aa63810b6ea9db5b62986e6ce9b7fa13a</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Cairo::Win32FontFace</name>
    <filename>classCairo_1_1Win32FontFace.html</filename>
    <base>Cairo::FontFace</base>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; Win32FontFace &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1Win32FontFace.html</anchorfile>
      <anchor>a629dcea5fb6e4a216dd088997928bb39</anchor>
      <arglist>(LOGFONTW *logfont)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; Win32FontFace &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1Win32FontFace.html</anchorfile>
      <anchor>adda6cdaf2090ad6f81302e655e224772</anchor>
      <arglist>(HFONT font)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; Win32FontFace &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1Win32FontFace.html</anchorfile>
      <anchor>acda7be9ab1154c5115debceb99962d56</anchor>
      <arglist>(LOGFONTW *logfont, HFONT font)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type></type>
      <name>Win32FontFace</name>
      <anchorfile>classCairo_1_1Win32FontFace.html</anchorfile>
      <anchor>ab1a4b0a5dd995ae84c35823b8fa801c3</anchor>
      <arglist>(LOGFONTW *logfont)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type></type>
      <name>Win32FontFace</name>
      <anchorfile>classCairo_1_1Win32FontFace.html</anchorfile>
      <anchor>a0ed6f8b28cd345795785436211a54673</anchor>
      <arglist>(HFONT font)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type></type>
      <name>Win32FontFace</name>
      <anchorfile>classCairo_1_1Win32FontFace.html</anchorfile>
      <anchor>a4a6934587e6ee36ec489299c40ac97d8</anchor>
      <arglist>(LOGFONTW *logfont, HFONT font)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Cairo::Win32PrintingSurface</name>
    <filename>classCairo_1_1Win32PrintingSurface.html</filename>
    <base>Cairo::Surface</base>
    <member kind="function">
      <type></type>
      <name>Win32PrintingSurface</name>
      <anchorfile>classCairo_1_1Win32PrintingSurface.html</anchorfile>
      <anchor>ac487a4537e12408e1420051976477032</anchor>
      <arglist>(cairo_surface_t *cobject, bool has_reference=false)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~Win32PrintingSurface</name>
      <anchorfile>classCairo_1_1Win32PrintingSurface.html</anchorfile>
      <anchor>accd5cc24e3e520caf2e91ca28a26f658</anchor>
      <arglist>() override</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; Win32PrintingSurface &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1Win32PrintingSurface.html</anchorfile>
      <anchor>a285a5754a42382bc6e4f1074bc27015f</anchor>
      <arglist>(HDC hdc)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Cairo::Win32ScaledFont</name>
    <filename>classCairo_1_1Win32ScaledFont.html</filename>
    <base>Cairo::ScaledFont</base>
    <member kind="function">
      <type>void</type>
      <name>select_font</name>
      <anchorfile>classCairo_1_1Win32ScaledFont.html</anchorfile>
      <anchor>ac6212da0cd1703a735c327480c4342cf</anchor>
      <arglist>(HDC hdc)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>done_font</name>
      <anchorfile>classCairo_1_1Win32ScaledFont.html</anchorfile>
      <anchor>ab06d5966b259ee21db5da72eb3726afd</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>get_metrics_factor</name>
      <anchorfile>classCairo_1_1Win32ScaledFont.html</anchorfile>
      <anchor>a601b1fc46e59226662556beb60f95800</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>get_logical_to_device</name>
      <anchorfile>classCairo_1_1Win32ScaledFont.html</anchorfile>
      <anchor>af8b8951dd38d14aaccd8c5de34efa410</anchor>
      <arglist>(Matrix &amp;logical_to_device) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>get_device_to_logical</name>
      <anchorfile>classCairo_1_1Win32ScaledFont.html</anchorfile>
      <anchor>af38486cf3623fe396f3387e821ab8858</anchor>
      <arglist>(Matrix &amp;device_to_logical) const</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; Win32ScaledFont &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1Win32ScaledFont.html</anchorfile>
      <anchor>af78b4c61ff8ba68784afd59dbb19c96c</anchor>
      <arglist>(const RefPtr&lt; Win32FontFace &gt; &amp;font_face, const Matrix &amp;font_matrix, const Matrix &amp;ctm, const FontOptions &amp;options=FontOptions())</arglist>
    </member>
    <member kind="function" protection="protected">
      <type></type>
      <name>Win32ScaledFont</name>
      <anchorfile>classCairo_1_1Win32ScaledFont.html</anchorfile>
      <anchor>a6257a1be5c290dedad297f34db488211</anchor>
      <arglist>(const RefPtr&lt; Win32FontFace &gt; &amp;font_face, const Matrix &amp;font_matrix, const Matrix &amp;ctm, const FontOptions &amp;options=FontOptions())</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Cairo::Win32Surface</name>
    <filename>classCairo_1_1Win32Surface.html</filename>
    <base>Cairo::Surface</base>
    <member kind="function">
      <type></type>
      <name>Win32Surface</name>
      <anchorfile>classCairo_1_1Win32Surface.html</anchorfile>
      <anchor>a74e9cee0ea5f89bcc5dc7444217b1f1d</anchor>
      <arglist>(cairo_surface_t *cobject, bool has_reference=false)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~Win32Surface</name>
      <anchorfile>classCairo_1_1Win32Surface.html</anchorfile>
      <anchor>a6d0e3f629f7c05921553284310369a1d</anchor>
      <arglist>() override</arglist>
    </member>
    <member kind="function">
      <type>HDC</type>
      <name>get_dc</name>
      <anchorfile>classCairo_1_1Win32Surface.html</anchorfile>
      <anchor>afd03f09a86e9877b0f65c0c70cc5284c</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>RefPtr&lt; ImageSurface &gt;</type>
      <name>get_image</name>
      <anchorfile>classCairo_1_1Win32Surface.html</anchorfile>
      <anchor>aa8847ca58ab0a4cbd131b9e9222a0717</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; Win32Surface &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1Win32Surface.html</anchorfile>
      <anchor>a64e602592f88521083b500209189fe86</anchor>
      <arglist>(HDC hdc)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; Win32Surface &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1Win32Surface.html</anchorfile>
      <anchor>a1270e130f8f5efb4a3bfa1938ef45e6a</anchor>
      <arglist>(Format format, int width, int height)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; Win32Surface &gt;</type>
      <name>create_with_dib</name>
      <anchorfile>classCairo_1_1Win32Surface.html</anchorfile>
      <anchor>a8e445820e7ab2355262b5f7b5f5a2dd1</anchor>
      <arglist>(Format format, int width, int height)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; Win32Surface &gt;</type>
      <name>create_with_ddb</name>
      <anchorfile>classCairo_1_1Win32Surface.html</anchorfile>
      <anchor>ade85a0e1a8e7f25fe43c34ac8079fe11</anchor>
      <arglist>(HDC hdc, Format format, int width, int height)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Cairo::XlibSurface</name>
    <filename>classCairo_1_1XlibSurface.html</filename>
    <base>Cairo::Surface</base>
    <member kind="function">
      <type></type>
      <name>XlibSurface</name>
      <anchorfile>classCairo_1_1XlibSurface.html</anchorfile>
      <anchor>afe45b69c03a79879b0e1b1cabb13a6da</anchor>
      <arglist>(cairo_surface_t *cobject, bool has_reference=false)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~XlibSurface</name>
      <anchorfile>classCairo_1_1XlibSurface.html</anchorfile>
      <anchor>ac0696508ab3b92bd79821c9057e97715</anchor>
      <arglist>() override</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_size</name>
      <anchorfile>classCairo_1_1XlibSurface.html</anchorfile>
      <anchor>a69b6337fa91dd53a054427e9a8235f16</anchor>
      <arglist>(int width, int height)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_drawable</name>
      <anchorfile>classCairo_1_1XlibSurface.html</anchorfile>
      <anchor>a92f59aab3ce0a113df0f6de18f306816</anchor>
      <arglist>(Drawable drawable, int width, int height)</arglist>
    </member>
    <member kind="function">
      <type>Drawable</type>
      <name>get_drawable</name>
      <anchorfile>classCairo_1_1XlibSurface.html</anchorfile>
      <anchor>a9ef13a348f26c3b5db362a4809c39ef0</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>const Display *</type>
      <name>get_display</name>
      <anchorfile>classCairo_1_1XlibSurface.html</anchorfile>
      <anchor>a3133bc0c1068c2065fdd84e27f87e7e1</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>Display *</type>
      <name>get_display</name>
      <anchorfile>classCairo_1_1XlibSurface.html</anchorfile>
      <anchor>a04641e3fd7bcca5d77a7d435a7de5bc1</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>Screen *</type>
      <name>get_screen</name>
      <anchorfile>classCairo_1_1XlibSurface.html</anchorfile>
      <anchor>a59159cf9dc3b00fb27a75dfb9b066411</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const Screen *</type>
      <name>get_screen</name>
      <anchorfile>classCairo_1_1XlibSurface.html</anchorfile>
      <anchor>a3fc0c500c82ebfae262da474619ea447</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>Visual *</type>
      <name>get_visual</name>
      <anchorfile>classCairo_1_1XlibSurface.html</anchorfile>
      <anchor>adb5e58976936e12ba7c4be1c167371f1</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const Visual *</type>
      <name>get_visual</name>
      <anchorfile>classCairo_1_1XlibSurface.html</anchorfile>
      <anchor>a94c86f4d79fdfb8a36c59e3cbec7c05e</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>get_depth</name>
      <anchorfile>classCairo_1_1XlibSurface.html</anchorfile>
      <anchor>a1fad561a0044b74f267ed2eb26fae4ca</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>get_height</name>
      <anchorfile>classCairo_1_1XlibSurface.html</anchorfile>
      <anchor>aa4d985dc6ee3f80c22a514fffaf38e90</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>get_width</name>
      <anchorfile>classCairo_1_1XlibSurface.html</anchorfile>
      <anchor>a21cd0c5a68be6fa060354747aedee7e0</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>XRenderPictFormat *</type>
      <name>get_xrender_format</name>
      <anchorfile>classCairo_1_1XlibSurface.html</anchorfile>
      <anchor>a4e7786fa26ba097e8c4c0d3e16dd7071</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; XlibSurface &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1XlibSurface.html</anchorfile>
      <anchor>ac0be3b9a34bacaf5ef5eb554a76aceec</anchor>
      <arglist>(Display *dpy, Drawable drawable, Visual *visual, int width, int height)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static RefPtr&lt; XlibSurface &gt;</type>
      <name>create</name>
      <anchorfile>classCairo_1_1XlibSurface.html</anchorfile>
      <anchor>a31ee8d6c2dc2c3e71bbdfcbc5b0bb15a</anchor>
      <arglist>(Display *dpy, Pixmap bitmap, Screen *screen, int width, int height)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static Cairo::RefPtr&lt; Cairo::XlibSurface &gt;</type>
      <name>create_with_xrender_format</name>
      <anchorfile>classCairo_1_1XlibSurface.html</anchorfile>
      <anchor>a651d7051dee3ab7c59efdc7732f88427</anchor>
      <arglist>(Display *dpy, Drawable drawable, Screen *screen, XRenderPictFormat *format, int width, int height)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>cairo_matrix_t</name>
    <filename>classcairo__matrix__t.html</filename>
  </compound>
  <compound kind="class">
    <name>hash_load_check_resize_trigger_size_base</name>
    <filename>classhash__load__check__resize__trigger__size__base.html</filename>
  </compound>
  <compound kind="class">
    <name>lu_counter_policy_base</name>
    <filename>classlu__counter__policy__base.html</filename>
  </compound>
  <compound kind="namespace">
    <name>Cairo</name>
    <filename>namespaceCairo.html</filename>
    <class kind="struct">Cairo::ColorStop</class>
    <class kind="class">Cairo::Context</class>
    <class kind="class">Cairo::Device</class>
    <class kind="class">Cairo::FontFace</class>
    <class kind="class">Cairo::FontOptions</class>
    <class kind="class">Cairo::FtFontFace</class>
    <class kind="class">Cairo::FtScaledFont</class>
    <class kind="class">Cairo::GlitzSurface</class>
    <class kind="class">Cairo::Gradient</class>
    <class kind="class">Cairo::ImageSurface</class>
    <class kind="class">Cairo::LinearGradient</class>
    <class kind="class">Cairo::logic_error</class>
    <class kind="class">Cairo::Matrix</class>
    <class kind="class">Cairo::Path</class>
    <class kind="class">Cairo::Pattern</class>
    <class kind="class">Cairo::PdfSurface</class>
    <class kind="class">Cairo::PsSurface</class>
    <class kind="class">Cairo::QuartzFontFace</class>
    <class kind="class">Cairo::QuartzSurface</class>
    <class kind="class">Cairo::RadialGradient</class>
    <class kind="class">Cairo::RecordingSurface</class>
    <class kind="class">Cairo::RefPtr</class>
    <class kind="class">Cairo::Region</class>
    <class kind="class">Cairo::ScaledFont</class>
    <class kind="class">Cairo::SolidPattern</class>
    <class kind="class">Cairo::Surface</class>
    <class kind="class">Cairo::SurfacePattern</class>
    <class kind="class">Cairo::SvgSurface</class>
    <class kind="class">Cairo::ToyFontFace</class>
    <class kind="class">Cairo::UserFontFace</class>
    <class kind="class">Cairo::Win32FontFace</class>
    <class kind="class">Cairo::Win32PrintingSurface</class>
    <class kind="class">Cairo::Win32ScaledFont</class>
    <class kind="class">Cairo::Win32Surface</class>
    <class kind="class">Cairo::XlibSurface</class>
    <member kind="typedef">
      <type>cairo_rectangle_t</type>
      <name>Rectangle</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a5a956a3226f8c0cece695c49f453e124</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>cairo_rectangle_int_t</type>
      <name>RectangleInt</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>afc1c428b04bf5249cb4b13ce8bf95b2c</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>cairo_font_extents_t</type>
      <name>FontExtents</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>aa7da46c699a67bfbdd5400af7e6b7b39</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>cairo_text_extents_t</type>
      <name>TextExtents</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>af6d8a4744616383984c99f8f052c7a5d</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>cairo_text_cluster_t</type>
      <name>TextCluster</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a3c23510889078c8a75d66add004ab288</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>cairo_glyph_t</type>
      <name>Glyph</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a2483f165322e844c095c7be95849fdc2</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>Operator</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a2d612c31d146fc32d486f9614560c8d1</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>OPERATOR_CLEAR</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a2d612c31d146fc32d486f9614560c8d1aa2c5cc98949fc510d058a40e4b5d28ff</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>OPERATOR_SOURCE</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a2d612c31d146fc32d486f9614560c8d1a59b66a5b95d6e3ed8cdebaf57717c623</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>OPERATOR_OVER</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a2d612c31d146fc32d486f9614560c8d1aefa21fe990e27b2c19017fbf827691e0</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>OPERATOR_IN</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a2d612c31d146fc32d486f9614560c8d1a50643bd3d909e6dd6f59bf8a3d7b1305</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>OPERATOR_OUT</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a2d612c31d146fc32d486f9614560c8d1a99d0e17305e6e3837eff89e87e17dd3f</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>OPERATOR_ATOP</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a2d612c31d146fc32d486f9614560c8d1a138d827bff22a56ea542e19a08839471</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>OPERATOR_DEST</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a2d612c31d146fc32d486f9614560c8d1a2a8b28a5adfcccaed2a3257ef3953f5b</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>OPERATOR_DEST_OVER</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a2d612c31d146fc32d486f9614560c8d1a6183d6187a356c0083f44484d63f814b</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>OPERATOR_DEST_IN</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a2d612c31d146fc32d486f9614560c8d1aceb620b25d955ac8c2c95b3af2b8d51f</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>OPERATOR_DEST_OUT</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a2d612c31d146fc32d486f9614560c8d1ab4844d149fd4bb37bfba21db1357593d</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>OPERATOR_DEST_ATOP</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a2d612c31d146fc32d486f9614560c8d1ad75365e1f469f43920f05dd0658313ad</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>OPERATOR_XOR</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a2d612c31d146fc32d486f9614560c8d1a1450e8ce1f45caa62f88849b6f806424</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>OPERATOR_ADD</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a2d612c31d146fc32d486f9614560c8d1accd32a58444054921ba8ab4989e0186d</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>OPERATOR_SATURATE</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a2d612c31d146fc32d486f9614560c8d1ac0bf6e068ff1d96ca21b75e92ef482c9</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>Antialias</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a2cb381e7f63bef767a7d697fc5af13b4</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>ANTIALIAS_DEFAULT</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a2cb381e7f63bef767a7d697fc5af13b4a3735c7a91b6357b95387b58665734ba3</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>ANTIALIAS_NONE</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a2cb381e7f63bef767a7d697fc5af13b4a94e3797b8dcda3573e739c3276b9c77a</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>ANTIALIAS_GRAY</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a2cb381e7f63bef767a7d697fc5af13b4a981aa2b3f2aef2f0f2e490cea6c3639a</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>ANTIALIAS_SUBPIXEL</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a2cb381e7f63bef767a7d697fc5af13b4a3ee3d2f0eea97db29139eac7950269aa</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>FillRule</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a1ba15b0a2e22c87c14af044801006c85</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>FILL_RULE_WINDING</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a1ba15b0a2e22c87c14af044801006c85a64d7bbc3c2d92a1ce8b5e3ec7ea050f7</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>FILL_RULE_EVEN_ODD</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a1ba15b0a2e22c87c14af044801006c85a25292f6e401747a4323ca3b83e3d4f0c</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>LineCap</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>abbb9aae64ef26733965e6d500ae76f1e</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>LINE_CAP_BUTT</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>abbb9aae64ef26733965e6d500ae76f1eaf3facd37abd0619faf1efe6c3b37ef72</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>LINE_CAP_ROUND</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>abbb9aae64ef26733965e6d500ae76f1ea05298af325e119d8cfbb6bf7f81f8255</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>LINE_CAP_SQUARE</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>abbb9aae64ef26733965e6d500ae76f1ea8462f35d238cdc413a90cf2ac37c35f8</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>LineJoin</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>adbc632404edaa736e01c12122239de73</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>LINE_JOIN_MITER</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>adbc632404edaa736e01c12122239de73aa63cde0bfd47a1d5a80f2db93b0de823</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>LINE_JOIN_ROUND</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>adbc632404edaa736e01c12122239de73ab4e1dd72513958e037306b1fddab6440</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>LINE_JOIN_BEVEL</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>adbc632404edaa736e01c12122239de73a63352551259f61a5e379589315a30de9</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>FontSlant</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a0a2c19fefac301a702a6b7fdb368bf55</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>FONT_SLANT_NORMAL</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a0a2c19fefac301a702a6b7fdb368bf55a428cfea8fca5951033f3d433855cb97d</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>FONT_SLANT_ITALIC</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a0a2c19fefac301a702a6b7fdb368bf55affa4510656348999982452cab35cd50d</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>FONT_SLANT_OBLIQUE</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a0a2c19fefac301a702a6b7fdb368bf55ab59432f2187bad6573e559810fe91727</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>FontWeight</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>ad8514818fb9292a5864b57f4b8a1e546</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>FONT_WEIGHT_NORMAL</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>ad8514818fb9292a5864b57f4b8a1e546accd31c17af7e0acce29f5d9df1b74e70</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>FONT_WEIGHT_BOLD</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>ad8514818fb9292a5864b57f4b8a1e546a438bd2ac850ef23ce7a537ae3395f398</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>Content</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a1f0f5d82599dfeabbeb2396dbfd767d0</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>CONTENT_COLOR</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a1f0f5d82599dfeabbeb2396dbfd767d0aa9223b86246bd608b91a8881e47cbf1a</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>CONTENT_ALPHA</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a1f0f5d82599dfeabbeb2396dbfd767d0a97d17d3896a8e8089b54f113bef09b4b</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>CONTENT_COLOR_ALPHA</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a1f0f5d82599dfeabbeb2396dbfd767d0a8c89da251cfcc2093c8f12c2f047b8bc</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>DeviceType</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>acd6c59cfdf7e4c9df93011f5dcf9b55c</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>DEVICE_TYPE_DRM</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>acd6c59cfdf7e4c9df93011f5dcf9b55ca75dbfe50cc3badbee161e77950fde604</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>DEVICE_TYPE_GL</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>acd6c59cfdf7e4c9df93011f5dcf9b55ca06d01f29b103687f1dcaadf0c6ad5ad3</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>DEVICE_TYPE_SCRIPT</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>acd6c59cfdf7e4c9df93011f5dcf9b55cab29ea8bdaa47d18cb47a2b7068195127</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>DEVICE_TYPE_XCB</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>acd6c59cfdf7e4c9df93011f5dcf9b55ca1aa95e828d40ab77257e1e764dee7674</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>DEVICE_TYPE_XLIB</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>acd6c59cfdf7e4c9df93011f5dcf9b55ca8c12b2ae886218a8d2e20f5648a4d534</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>DEVICE_TYPE_XML</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>acd6c59cfdf7e4c9df93011f5dcf9b55ca8089c97284983496ed8be6dc35e14acd</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>Format</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>ad3f86970e1bd354b263303c9b8759166</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>FORMAT_ARGB32</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>ad3f86970e1bd354b263303c9b8759166afc97f1888578477fd656cf72d3421fbc</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>FORMAT_RGB24</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>ad3f86970e1bd354b263303c9b8759166ad8bdac2cab4a41442aa9a65a861a1f8a</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>FORMAT_A8</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>ad3f86970e1bd354b263303c9b8759166a014ebd0c5ac40d95635f498719d3be81</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>FORMAT_A1</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>ad3f86970e1bd354b263303c9b8759166a562e3f4d6672c1d1d713805c1a1d0e2d</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>FORMAT_RGB16_565</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>ad3f86970e1bd354b263303c9b8759166a02af37bc588eaf452132b45eae083980</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>Extend</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>ae98882fd000921907007555a36a432a5</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>EXTEND_NONE</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>ae98882fd000921907007555a36a432a5abc537645a0ee134db9f85b840ff31ecc</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>EXTEND_REPEAT</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>ae98882fd000921907007555a36a432a5a441fb6974fa3eb7d20a8c4a23bac5b3b</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>EXTEND_REFLECT</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>ae98882fd000921907007555a36a432a5a8d3a371a30c6ed16f370f3c1198f5f0c</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>EXTEND_PAD</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>ae98882fd000921907007555a36a432a5a962ebab53840cfa2c8e2a6534c93a70d</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>Filter</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a92b32ad7db301e18386477566c1caa6a</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>FILTER_FAST</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a92b32ad7db301e18386477566c1caa6aa53741dee114adbbc9860ff6979044ee9</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>FILTER_GOOD</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a92b32ad7db301e18386477566c1caa6aa94fe587cf45f2ca0941eb81edc247a5c</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>FILTER_BEST</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a92b32ad7db301e18386477566c1caa6aaa20fe9f49ecb50a8ca50adb840404bb6</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>FILTER_NEAREST</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a92b32ad7db301e18386477566c1caa6aa4c9be1534f351531eb1c70deb690926b</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>FILTER_BILINEAR</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a92b32ad7db301e18386477566c1caa6aad2418ba123c6a441aefc0b22cba59758</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>FILTER_GAUSSIAN</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a92b32ad7db301e18386477566c1caa6aa9681c5deb5aeac89bfcbec9734421169</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>SubpixelOrder</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a4a23dc1a6008ac7395bd44767b288783</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SUBPIXEL_ORDER_DEFAULT</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a4a23dc1a6008ac7395bd44767b288783ad3e1bfde4f4ef4072fe7241151a9b400</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SUBPIXEL_ORDER_RGB</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a4a23dc1a6008ac7395bd44767b288783ab131d2776a0835afb077a46222056b86</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SUBPIXEL_ORDER_BGR</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a4a23dc1a6008ac7395bd44767b288783a91d7c3c2c36d11561d3bb4edc80f4754</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SUBPIXEL_ORDER_VRGB</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a4a23dc1a6008ac7395bd44767b288783a4a33b2508ecb3c7727993c642581ec89</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SUBPIXEL_ORDER_VBGR</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a4a23dc1a6008ac7395bd44767b288783ac4aa9ec4bf74374f5114eeb4dbe8531e</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>HintStyle</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a42c908e3a6e1e7e402081b36659b42e4</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>HINT_STYLE_DEFAULT</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a42c908e3a6e1e7e402081b36659b42e4aaccef9b38249b23be976d7cf3c830511</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>HINT_STYLE_NONE</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a42c908e3a6e1e7e402081b36659b42e4a6c6c834f7a2a4a916467cc56faf87899</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>HINT_STYLE_SLIGHT</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a42c908e3a6e1e7e402081b36659b42e4a622ff5142bc1ed463de74c10b094d7de</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>HINT_STYLE_MEDIUM</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a42c908e3a6e1e7e402081b36659b42e4a86913e7e6f6e4a47a2ac9ffccc307be0</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>HINT_STYLE_FULL</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a42c908e3a6e1e7e402081b36659b42e4a2f1fbcf0e711122f6488788b93b64746</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>HintMetrics</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a36aea516c8dd84609f7e5f5968a3d7c0</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>HINT_METRICS_DEFAULT</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a36aea516c8dd84609f7e5f5968a3d7c0a0033f53b7ebd8d5080f2072e706c49eb</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>HINT_METRICS_OFF</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a36aea516c8dd84609f7e5f5968a3d7c0a4a0455b3f2057678f18f0bb468a480d7</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>HINT_METRICS_ON</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a36aea516c8dd84609f7e5f5968a3d7c0a9df9bac60d68417bbc63d17075890d45</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>SurfaceType</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>af11d962e38a38a2d92fc1473fbe92549</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SURFACE_TYPE_IMAGE</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>af11d962e38a38a2d92fc1473fbe92549a0ecba6c968b41e0f20c04da907a9015c</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SURFACE_TYPE_PDF</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>af11d962e38a38a2d92fc1473fbe92549a779d4582e7e57cc7fe8febe22d01c8f5</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SURFACE_TYPE_PS</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>af11d962e38a38a2d92fc1473fbe92549a965157adefd504ddb33443bae86bdaf0</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SURFACE_TYPE_XLIB</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>af11d962e38a38a2d92fc1473fbe92549a557b12264bea7e9291a88a237006bb3b</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SURFACE_TYPE_XCB</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>af11d962e38a38a2d92fc1473fbe92549a96a97d03b0110b9f2eb1fa9940b3dd37</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SURFACE_TYPE_GLITZ</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>af11d962e38a38a2d92fc1473fbe92549aee5fa464493ed2f61f22873c3e5b9093</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SURFACE_TYPE_QUARTZ</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>af11d962e38a38a2d92fc1473fbe92549a37e0a949af7b4739b9bef045f60b4d0c</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SURFACE_TYPE_WIN32</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>af11d962e38a38a2d92fc1473fbe92549ac30d738b509c7fb082e8d7ba37f21203</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SURFACE_TYPE_BEOS</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>af11d962e38a38a2d92fc1473fbe92549a5a984da99a0b5e90a0f0c28ef05b64af</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SURFACE_TYPE_DIRECTFB</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>af11d962e38a38a2d92fc1473fbe92549a8c4a28995e8ea61cc44386ffd4d4ed48</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SURFACE_TYPE_SVG</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>af11d962e38a38a2d92fc1473fbe92549aabfee100acdb2044b01af44bf6a3441e</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SURFACE_TYPE_OS2</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>af11d962e38a38a2d92fc1473fbe92549aa126fd2dfdb86c1671807f9c23bba160</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SURFACE_TYPE_WIN32_PRINTING</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>af11d962e38a38a2d92fc1473fbe92549ab516fc39323a2df146423d9eb9018c11</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SURFACE_TYPE_QUARTZ_IMAGE</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>af11d962e38a38a2d92fc1473fbe92549afe4724b60fb5cd4d67187385c1160338</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SURFACE_TYPE_SCRIPT</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>af11d962e38a38a2d92fc1473fbe92549a29855dec551acfed325825a0d4fab88f</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SURFACE_TYPE_QT</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>af11d962e38a38a2d92fc1473fbe92549a673f9b9763985b8b113f1a7fa2f827a8</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SURFACE_TYPE_RECORDING</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>af11d962e38a38a2d92fc1473fbe92549af7623d51bf572af98340a4e41bf0490f</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SURFACE_TYPE_VG</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>af11d962e38a38a2d92fc1473fbe92549aae9513a3ada214dcf2059fbfdda47e79</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SURFACE_TYPE_GL</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>af11d962e38a38a2d92fc1473fbe92549a44a856cd1b196ea2f588551257a1e598</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SURFACE_TYPE_DRM</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>af11d962e38a38a2d92fc1473fbe92549a57ee82d8d88e5d4e366155a58faf2a0c</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SURFACE_TYPE_TEE</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>af11d962e38a38a2d92fc1473fbe92549a758ec9d0af7fa7ad42c35ac54569aec0</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SURFACE_TYPE_XML</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>af11d962e38a38a2d92fc1473fbe92549a028253334ffd3cb31bb6b74d03012545</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SURFACE_TYPE_SKIA</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>af11d962e38a38a2d92fc1473fbe92549a8df3e26b8e75d766036b57998927672d</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SURFACE_TYPE_SUBSURFACE</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>af11d962e38a38a2d92fc1473fbe92549ae43c50010ace844cd5a9e5d5da9e4f83</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>PatternType</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>afeff18f1043713479dd6ceb4aa4d4f02</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>PATTERN_TYPE_SOLID</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>afeff18f1043713479dd6ceb4aa4d4f02acc00394b686b5a51707eb50507d0ff98</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>PATTERN_TYPE_SURFACE</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>afeff18f1043713479dd6ceb4aa4d4f02aa3d3d979bffbe8abace7427d2b75f286</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>PATTERN_TYPE_LINEAR</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>afeff18f1043713479dd6ceb4aa4d4f02a9e26bb15e701bef4ddd597c56dd9f3df</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>PATTERN_TYPE_RADIAL</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>afeff18f1043713479dd6ceb4aa4d4f02ae3d2664b903efd92b03cabe25a7467c7</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>FontType</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a23e1a9a5be49d16cf3871e841e8ab522</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>FONT_TYPE_TOY</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a23e1a9a5be49d16cf3871e841e8ab522a11badc6cb73857e765b9d08ae75d10e1</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>FONT_TYPE_FT</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a23e1a9a5be49d16cf3871e841e8ab522a7780824d70ec08548798c075928e121c</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>FONT_TYPE_WIN32</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a23e1a9a5be49d16cf3871e841e8ab522a322154b778271602a36b8a777888cd30</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>FONT_TYPE_ATSUI</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a23e1a9a5be49d16cf3871e841e8ab522ae959d2d48f5b0f2110762d15eadf6ba9</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>FONT_TYPE_QUARTZ</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a23e1a9a5be49d16cf3871e841e8ab522a900b0adf7ea2cfed16956be0a26d3cff</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>FONT_TYPE_USER</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a23e1a9a5be49d16cf3871e841e8ab522ad87ea398fb66e3b0df5b8a15685c2ea1</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>TextClusterFlags</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a61b770cf36c555a4098b5428e030542a</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>TEXT_CLUSTER_FLAG_BACKWARD</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a61b770cf36c555a4098b5428e030542aad1fc31baabb2eaa7661a0b8a91ad3b03</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>RegionOverlap</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>adcdefbdb596418377c360914ccee4aba</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>REGION_OVERLAP_IN</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>adcdefbdb596418377c360914ccee4abaa566be43517d236c5547295ce50fe0870</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>REGION_OVERLAP_OUT</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>adcdefbdb596418377c360914ccee4abaa8f4ea05838aace48418bb07bc985a228</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>REGION_OVERLAP_PART</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>adcdefbdb596418377c360914ccee4abaa0085211792a91f8ac32fa6c3c205f863</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>FtSynthesize</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a5666215cadfe7c88ff03f9d465a8d35a</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>FT_SYNTHESIZE_BOLT</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a5666215cadfe7c88ff03f9d465a8d35aae0487862822d33fcacee5c7754f8f423</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>FT_SYNTHESIZE_OBLIQUE</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a5666215cadfe7c88ff03f9d465a8d35aad825eebf1473ee46c22c8fba9c778e1c</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>PdfVersion</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a594c3b02635245683fcb33c23872a125</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>PDF_VERSION_1_4</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a594c3b02635245683fcb33c23872a125ae575205b13518242f1071bb4107cdefd</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>PDF_VERSION_1_5</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a594c3b02635245683fcb33c23872a125a32c02c7e6e6929a060509d6c915a9664</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>PsLevel</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a452db49f19542c791e4a331f052a9a00</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>PS_LEVEL_2</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a452db49f19542c791e4a331f052a9a00a7fba4425a32994189848015369c71db1</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>PS_LEVEL_3</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a452db49f19542c791e4a331f052a9a00ae540de6bec8cf457548756a83457223b</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>SvgVersion</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a853a6353847b8cd86001a98d36b245ca</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SVG_VERSION_1_1</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a853a6353847b8cd86001a98d36b245caaa2342af6873626640d2126f75fe0ab48</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SVG_VERSION_1_2</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a853a6353847b8cd86001a98d36b245caac9a963a188f21ab16da513d4482fb7bd</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>FtSynthesize</type>
      <name>operator|</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a94561a8060bda6e51c828bb56766a5c9</anchor>
      <arglist>(FtSynthesize a, FtSynthesize b)</arglist>
    </member>
    <member kind="function">
      <type>FtSynthesize</type>
      <name>operator&amp;</name>
      <anchorfile>namespaceCairo.html</anchorfile>
      <anchor>a818e3bec644295d165121bd5d662fe10</anchor>
      <arglist>(FtSynthesize a, FtSynthesize b)</arglist>
    </member>
  </compound>
  <compound kind="page">
    <name>index</name>
    <title>Cairomm: A C++ wrapper for the cairo graphics library</title>
    <filename>index.html</filename>
    <docanchor file="index.html">License</docanchor>
    <docanchor file="index.html">Introduction</docanchor>
  </compound>
</tagfile>
