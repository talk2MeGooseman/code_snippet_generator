import logging
from guesslang import Guess
import azure.functions as func


def main(req: func.HttpRequest) -> func.HttpResponse:
    try:
        req_body = req.get_json()
    except ValueError:
        return func.HttpResponse(
            "JSON Parse Error",
            status_code=200
        )
    else:
        code = req_body.get('code')

        if code:
            guess = Guess()
            name = guess.language_name(code)

            return func.HttpResponse(f"Language: {name}", status_code=200)
        else:
            return func.HttpResponse(
                "No code provided in the query string parameter 'code'",
                status_code=200
            )
