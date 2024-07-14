from flask import Blueprint
from core import db
from core.apis import decorators,responses
from .schema import AssignmentSchema
from core.models.assignments import Assignment, AssignmentStateEnum
from core.models.teachers import Teacher


principal_assignments_resources = Blueprint("principal_assignments_resources",__name__)

@principal_assignments_resources.route("/assignments",methods=["GET"],strict_slashes=False)
@decorators.authenticate_principal
def get_all_assigments(r):
    """Return all the Graded and Submited assignments"""
    all_assignments = Assignment.get_all_assignments_for_principal()
    all_assignments_dump = AssignmentSchema().dump(all_assignments, many=True)
    return responses.APIResponse.respond(data=all_assignments_dump)