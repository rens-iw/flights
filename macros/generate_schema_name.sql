{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}

    {%- if custom_schema_name is none -%}
        {{ default_schema }}

    {%- elif target.name == 'ci' -%}
        {{ default_schema }}

    {%- elif target.name == 'dev' -%}
        {{ default_schema }}_{{ target.user | trim }}

    {%- else -%}
        {{ custom_schema_name | trim }}

    {%- endif -%}

{%- endmacro %}

