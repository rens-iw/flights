{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- set clean_user = target.user.split('@')[0].replace('.', '_') -%}

    {%- if custom_schema_name is none -%}
        {{ default_schema }}

    {%- elif target.name == 'ci' -%}
        {{ default_schema }}

    {%- elif target.name == 'dev' -%}
        {{ default_schema }}_{{ clean_user }}

    {%- else -%}
        {{ custom_schema_name | trim }}

    {%- endif -%}

{%- endmacro %}

