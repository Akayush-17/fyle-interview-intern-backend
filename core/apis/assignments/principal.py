from flask import Blueprint
from core.apis import decorators, responses
from .schema import AssignmentSchema
from core.models.assignments import Assignment

principal_assignments_resources = Blueprint("principal_assignments_resources", __name__)

@principal_assignments_resources.route("/assignments", methods=["GET"], strict_slashes=False)
@decorators.authenticate_principal
def get_all_assignments(p):
    """Return All Assignments that are Graded and Submitted"""
    all_assignments = Assignment.get_all_assignments_for_principal()
    all_assignments_dump = AssignmentSchema().dump(all_assignments, many=True)
    return responses.APIResponse.respond(data=all_assignments_dump)