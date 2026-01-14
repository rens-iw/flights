{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- set clean_user = target.user.split('@')[0].replace('.', '_') | lower -%}

    {%- if custom_schema_name is none -%}
        {{ default_schema | lower }}

    {%- elif target.name == 'ci' -%}
        {{ default_schema | lower }}

    {%- elif target.name == 'dev' -%}
        {{ ((custom_schema_name or default_schema) ~ '_' ~ clean_user) | lower }}

    {%- else -%}
        {{ custom_schema_name | trim | lower }}

    {%- endif -%}

{%- endmacro %}