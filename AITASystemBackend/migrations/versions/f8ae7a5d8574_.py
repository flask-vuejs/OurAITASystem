"""empty message

Revision ID: f8ae7a5d8574
Revises: 738cd462e4bf
Create Date: 2024-07-16 13:20:42.526430

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'f8ae7a5d8574'
down_revision = '738cd462e4bf'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('papers', schema=None) as batch_op:
        batch_op.add_column(sa.Column('abstract', sa.Text(), nullable=True))
        batch_op.add_column(sa.Column('keywords', sa.String(length=255), nullable=True))

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('papers', schema=None) as batch_op:
        batch_op.drop_column('keywords')
        batch_op.drop_column('abstract')

    # ### end Alembic commands ###