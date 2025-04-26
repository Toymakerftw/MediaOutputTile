import android.service.quicksettings.TileService;
import android.content.Intent;
import android.provider.Settings;

public class MediaOutputTileService extends TileService {
    @Override
    public void onClick() {
        super.onClick();
        Intent intent = new Intent(Settings.ACTION_SOUND_SETTINGS);
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        startActivityAndCollapse(intent);
    }
}
