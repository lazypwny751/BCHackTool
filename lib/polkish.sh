polkish.exec() {
	local i=""
	local PRIO=(
		"sudo"
		"doas"
		"pkexec"
	)

	for i in "${PRIO[@]}" ; do
		if command -v "${i}" &> /dev/null ; then
			local DEFAULT="${i}"
			local status="true"
			break
		else
			local status="false"
		fi
	done

	if "${status}" ; then
		exec "${DEFAULT}" "${@}"
	else
		echo "${0##*/}: ${FUNCNAME%*.}: couldn't determine priority of that programs: \"${PRIO[@]}\"."
		return 1
	fi
}
