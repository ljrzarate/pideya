class __View.Asignature extends Monocle.View

	container: "section#main article#art_main ul"

	template: """
		<li>
            <div class="right bubble orange">{{semester}} semestre</div>
			<strong>{{name}}</strong>
		</li>
		"""