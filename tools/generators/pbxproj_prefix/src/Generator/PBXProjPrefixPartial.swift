import GeneratorCommon
import PBXProj

extension Generator {
    /// Calculates `PBXProj` prefix partial.
    static func pbxProjPrefixPartial(
        bazelDependenciesPartial: String,
        pbxProjectPrefixPartial: String,
        minimumXcodeVersion: SemanticVersion
    ) -> String {
        // This is a `PBXProj` partial for the start of the `PBXProj` element.
        //
        // The tabs for indenting are intentional. The trailing newlines are
        // intentional, as `cat` needs them to concatenate the partials
        // correctly.
        return #"""
// !$*UTF8*$!
{
	archiveVersion = 1;
	classes = {
	};
	objectVersion = \#(minimumXcodeVersion.major >= 14 ? 56 : 55);
	objects = {
\#(bazelDependenciesPartial)\#
\#(pbxProjectPrefixPartial)\#

"""#
    }
}
