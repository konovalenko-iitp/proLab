# ProLab: perceptually uniform projective colour coordinate system

This is the MatLab-implementation of convertions function from and to perceptually uniform colour space proLab
described in the following paper

    @article{konovalenko2020prolab,
    title={ProLab: perceptually uniform projective colour coordinate system},
    author={Konovalenko, Ivan A and Smagina, Anna A and Nikolaev, Dmitry P and Nikolaev, Petr P},
    journal={arXiv preprint arXiv:2012.07653},
    year={2020}
    }

## The main files are listed below

\matlab\proLab_color_conversions\XYZ2proLab.m — function that implements transformation form CIE XYZ color space to proLab color space.

\matlab\proLab_color_conversions\proLab2XYZ.m — function that implements transformation form proLab color space to CIE XYZ color space.

\matlab\code_examples.m — script which contains examples of using XYZ2proLab and proLab2XYZ.

\matlab\proLab_reference_values.m — script which contains reference values for proLab testing.

\matlab\proLab_color_conversions\proLab_param.m — function that stores and returns proLab parameters.

\matlab\search_optimal_proLab_param.m — script that implements the search optimal proLab parameters.

\matlab\reference_illuminant.m — function that returns CIE XYZ color coordinates of reference illuminant.

\matlab\D65.m — function that returns CIE XYZ color coordinates of D65 standard illuminant.
