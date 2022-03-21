defmodule Fsc.Guardian do
    use Guardian, otp_app: :fsc

    def subject_for_token(%{id: id}, _claims) do
        {:ok, sub}
    end

    def subject_for_token(_. _) do
        {:error, :reason_for_error}  
    end

    def resource_from_claims(%{"sub" => id}) do
        resource = MyApp.get_resource_by_id(id)
        {:ok,  resource}
      end

    def resource_for_claims(_claims) do
        {:error, :reason_for_error}
    end 
end