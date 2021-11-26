import psycopg2


def query_with_return_value(query):
    try:

        user_name = "Vivike"
        password = "*********"
        host = "localhost"
        database_name = "codecool"

        connect_str = "postgresql://{user_name}:{password}@{host}/{database_name}".format(
            user_name=user_name,
            password=password,
            host=host,
            database_name=database_name
        )

        connection = psycopg2.connect(connect_str)
        connection.autocommit = True
        cursor = connection.cursor()

        cursor.execute(query)

        rows = cursor.fetchall()

        cursor.close()
        return rows

    except psycopg2.DatabaseError as exception:
        print(exception)

    finally:
        if 'connection' in locals():
            connection.close()


def query_without_return_value(query):

    try:

        user_name = "Vivike"
        password = "********"
        host = "localhost"
        database_name = "codecool"

        connect_str = "postgresql://{user_name}:{password}@{host}/{database_name}".format(
            user_name=user_name,
            password=password,
            host=host,
            database_name=database_name
        )

        connection = psycopg2.connect(connect_str)
        connection.autocommit = True
        cursor = connection.cursor()

        cursor.execute(query)
        cursor.close()

    except psycopg2.DatabaseError as exception:
        print(exception)

    finally:
        if 'connection' in locals():
            connection.close()


def check_review_exists(reviewID):
    review_exists = query_with_return_value(
        f"SELECT EXISTS(SELECT 1 FROM review WHERE review_id = {reviewID})"
        )
    return(review_exists[0][0])


def update_mark(reviewID, new_mark):
    review_exists = check_review_exists(reviewID)

    if review_exists:
        try:
            query = f"""
                            UPDATE review
                            SET mark = '{new_mark}'
                            WHERE review_id = {reviewID};
            """
            query_without_return_value(query)
            print("The review table is now updated")
        except psycopg2.DatabaseError:
            print("Ooops something went wrong, please try again later!")
    else:
        print("Review is not in table")


def delete_mark(reviewID):
    review_exists = check_review_exists(reviewID)

    if review_exists:
        try:
            query = f"""
                    DELETE FROM review
                    WHERE review_id = {reviewID};
            """
            query_without_return_value(query)
            print("The review table is now updated")
        except psycopg2.DatabaseError:
            print("Ooops something went wrong, please try again later!")
    else:
        print("Review is not in table")


# print(check_review_exists(reviewID))
# update_mark(reviewID, new_mark)
# delete_mark(reviewID)
